; DESCRIPTION: Composite: Creates a blue rectangular region at (119, 168) spanning 105 by 18 pixels then Draws a blue circle centered at (185, 74) with radius 49.
; PLAN: r0=119(x), r1=168(y), r2=105(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=185(x), r6=74(y), r7=49(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 119
LDI r1, 168
LDI r2, 105
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 74
LDI r7, 49
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
