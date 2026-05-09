; DESCRIPTION: Composite: Creates a purple rectangular region at (149, 95) spanning 53 by 98 pixels then Creates a black circular shape at (235, 77) with radius 69.
; PLAN: r0=149(x), r1=95(y), r2=53(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=235(x), r6=77(y), r7=69(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 149
LDI r1, 95
LDI r2, 53
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 77
LDI r7, 69
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
