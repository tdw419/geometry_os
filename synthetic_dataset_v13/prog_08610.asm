; DESCRIPTION: Composite: Places a white 116x57 rectangle at position (186, 91) then Sets a single black pixel at (309, 32) then Places a cyan line segment connecting (299, 8) to (23, 219).
; PLAN: r0=186(x), r1=91(y), r2=116(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=309(x), r6=32(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=299(x1), r11=8(y1), r12=23(x2), r13=219(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 186
LDI r1, 91
LDI r2, 116
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 32
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 299
LDI r11, 8
LDI r12, 23
LDI r13, 219
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
