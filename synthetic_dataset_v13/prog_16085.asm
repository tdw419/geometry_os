; DESCRIPTION: Composite: Creates a blue rectangular region at (27, 76) spanning 12 by 79 pixels then Creates a blue circular shape at (76, 121) with radius 65.
; PLAN: r0=27(x), r1=76(y), r2=12(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=76(x), r6=121(y), r7=65(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 27
LDI r1, 76
LDI r2, 12
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 121
LDI r7, 65
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
