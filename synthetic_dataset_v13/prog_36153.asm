; DESCRIPTION: Composite: Places a blue line segment connecting (471, 23) to (119, 203) then Draws a white circle centered at (379, 105) with radius 71.
; PLAN: r0=471(x1), r1=23(y1), r2=119(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=379(x), r6=105(y), r7=71(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 471
LDI r1, 23
LDI r2, 119
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 105
LDI r7, 71
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
