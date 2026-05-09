; DESCRIPTION: Composite: Creates a purple rectangular region at (355, 105) spanning 20 by 80 pixels then Creates a white circular shape at (282, 136) with radius 73.
; PLAN: r0=355(x), r1=105(y), r2=20(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=282(x), r6=136(y), r7=73(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 355
LDI r1, 105
LDI r2, 20
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 136
LDI r7, 73
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
