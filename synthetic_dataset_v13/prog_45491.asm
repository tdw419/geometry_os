; DESCRIPTION: Composite: Sets a single blue pixel at (7, 139) then Renders a yellow line between points (229, 130) and (89, 210) then Draws a magenta circle centered at (153, 191) with radius 62.
; PLAN: r0=7(x), r1=139(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=229(x1), r6=130(y1), r7=89(x2), r8=210(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=153(x), r11=191(y), r12=62(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 7
LDI r1, 139
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 229
LDI r6, 130
LDI r7, 89
LDI r8, 210
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 153
LDI r11, 191
LDI r12, 62
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
