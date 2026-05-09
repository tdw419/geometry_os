; DESCRIPTION: Composite: Draws a purple circle centered at (135, 192) with radius 51 then Draws a orange rectangle at (345, 53) with width 99 and height 106 then Sets a single purple pixel at (162, 12).
; PLAN: r0=135(x), r1=192(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=345(x), r6=53(y), r7=99(width), r8=106(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=162(x), r11=12(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 135
LDI r1, 192
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 345
LDI r6, 53
LDI r7, 99
LDI r8, 106
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 12
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
