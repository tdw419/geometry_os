; DESCRIPTION: Composite: Renders a yellow line between points (185, 64) and (103, 89) then Draws a orange circle centered at (441, 77) with radius 43.
; PLAN: r0=185(x1), r1=64(y1), r2=103(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=441(x), r6=77(y), r7=43(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 185
LDI r1, 64
LDI r2, 103
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 77
LDI r7, 43
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
