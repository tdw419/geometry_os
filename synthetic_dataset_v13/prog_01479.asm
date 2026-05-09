; DESCRIPTION: Composite: Renders a yellow line between points (289, 125) and (127, 227) then Creates a red circular shape at (454, 134) with radius 15.
; PLAN: r0=289(x1), r1=125(y1), r2=127(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=454(x), r6=134(y), r7=15(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 289
LDI r1, 125
LDI r2, 127
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 134
LDI r7, 15
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
