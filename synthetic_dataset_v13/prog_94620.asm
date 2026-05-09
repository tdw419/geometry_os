; DESCRIPTION: Composite: Places a black line segment connecting (6, 6) to (496, 160) then Renders a purple disk with center (358, 156) and radius 71.
; PLAN: r0=6(x1), r1=6(y1), r2=496(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=358(x), r6=156(y), r7=71(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 6
LDI r1, 6
LDI r2, 496
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 156
LDI r7, 71
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
