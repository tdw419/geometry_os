; DESCRIPTION: Composite: Renders a blue line between points (486, 54) and (384, 9) then Creates a orange circular shape at (164, 35) with radius 22 then Sets a single blue pixel at (118, 169).
; PLAN: r0=486(x1), r1=54(y1), r2=384(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=35(y), r7=22(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=118(x), r11=169(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 486
LDI r1, 54
LDI r2, 384
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 35
LDI r7, 22
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 118
LDI r11, 169
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
