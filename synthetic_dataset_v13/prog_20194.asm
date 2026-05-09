; DESCRIPTION: Composite: Renders a purple line between points (313, 107) and (388, 26) then Creates a orange circular shape at (426, 181) with radius 75.
; PLAN: r0=313(x1), r1=107(y1), r2=388(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=426(x), r6=181(y), r7=75(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 313
LDI r1, 107
LDI r2, 388
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 181
LDI r7, 75
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
