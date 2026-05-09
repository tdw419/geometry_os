; DESCRIPTION: Composite: Creates a white rectangular region at (235, 95) spanning 66 by 13 pixels then Renders a purple disk with center (278, 217) and radius 16.
; PLAN: r0=235(x), r1=95(y), r2=66(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x), r6=217(y), r7=16(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 235
LDI r1, 95
LDI r2, 66
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 217
LDI r7, 16
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
