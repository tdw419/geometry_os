; DESCRIPTION: Composite: Places a red line segment connecting (15, 150) to (209, 250) then Creates a magenta circular shape at (65, 185) with radius 24 then Sets a single magenta pixel at (189, 129).
; PLAN: r0=15(x1), r1=150(y1), r2=209(x2), r3=250(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=185(y), r7=24(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=189(x), r11=129(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 15
LDI r1, 150
LDI r2, 209
LDI r3, 250
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 185
LDI r7, 24
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 189
LDI r11, 129
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
