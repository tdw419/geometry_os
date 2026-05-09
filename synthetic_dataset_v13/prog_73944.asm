; DESCRIPTION: Composite: Places a white line segment connecting (321, 89) to (355, 135) then Places a yellow dot at position (65, 23) then Renders a magenta disk with center (343, 150) and radius 79.
; PLAN: r0=321(x1), r1=89(y1), r2=355(x2), r3=135(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=23(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=343(x), r11=150(y), r12=79(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 321
LDI r1, 89
LDI r2, 355
LDI r3, 135
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 23
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 343
LDI r11, 150
LDI r12, 79
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
