; DESCRIPTION: Composite: Sets a single purple pixel at (126, 249) then Draws a yellow line from (272, 65) to (62, 64) then Draws a green circle centered at (101, 172) with radius 69.
; PLAN: r0=126(x), r1=249(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=272(x1), r6=65(y1), r7=62(x2), r8=64(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=101(x), r11=172(y), r12=69(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 126
LDI r1, 249
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 272
LDI r6, 65
LDI r7, 62
LDI r8, 64
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 101
LDI r11, 172
LDI r12, 69
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
