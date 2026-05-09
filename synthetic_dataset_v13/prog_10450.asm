; DESCRIPTION: Composite: Places a cyan line segment connecting (263, 128) to (436, 78) then Places a purple 91x49 rectangle at position (102, 136) then Sets a single yellow pixel at (41, 175).
; PLAN: r0=263(x1), r1=128(y1), r2=436(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=102(x), r6=136(y), r7=91(width), r8=49(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=41(x), r11=175(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 263
LDI r1, 128
LDI r2, 436
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 136
LDI r7, 91
LDI r8, 49
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 41
LDI r11, 175
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
