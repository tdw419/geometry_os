; DESCRIPTION: Composite: Renders a purple line between points (53, 140) and (348, 97) then Creates a black circular shape at (368, 152) with radius 77.
; PLAN: r0=53(x1), r1=140(y1), r2=348(x2), r3=97(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=368(x), r6=152(y), r7=77(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 53
LDI r1, 140
LDI r2, 348
LDI r3, 97
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 152
LDI r7, 77
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
