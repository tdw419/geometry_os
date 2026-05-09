; DESCRIPTION: Composite: Places a black line segment connecting (497, 229) to (145, 81) then Creates a white circular shape at (499, 227) with radius 13.
; PLAN: r0=497(x1), r1=229(y1), r2=145(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=499(x), r6=227(y), r7=13(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 497
LDI r1, 229
LDI r2, 145
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 499
LDI r6, 227
LDI r7, 13
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
