; DESCRIPTION: Composite: Places a red line segment connecting (140, 140) to (230, 49) then Creates a red circular shape at (424, 88) with radius 77.
; PLAN: r0=140(x1), r1=140(y1), r2=230(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=424(x), r6=88(y), r7=77(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 140
LDI r1, 140
LDI r2, 230
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 88
LDI r7, 77
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
