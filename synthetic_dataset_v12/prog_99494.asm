; DESCRIPTION: Composite: Places a cyan line segment connecting (272, 6) to (422, 230) then Places a white dot at position (452, 79) then Places a yellow 53x64 rectangle at position (298, 56).
; PLAN: r0=272(x1), r1=6(y1), r2=422(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=452(x), r6=79(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=298(x), r11=56(y), r12=53(width), r13=64(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 272
LDI r1, 6
LDI r2, 422
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 79
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 298
LDI r11, 56
LDI r12, 53
LDI r13, 64
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
