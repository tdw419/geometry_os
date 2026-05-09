; DESCRIPTION: Composite: Places a white 80x26 rectangle at position (33, 132) then Renders a cyan line between points (310, 214) and (482, 160) then Sets a single blue pixel at (447, 21).
; PLAN: r0=33(x), r1=132(y), r2=80(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=310(x1), r6=214(y1), r7=482(x2), r8=160(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=447(x), r11=21(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 33
LDI r1, 132
LDI r2, 80
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 214
LDI r7, 482
LDI r8, 160
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 447
LDI r11, 21
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
