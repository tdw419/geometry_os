; DESCRIPTION: Composite: Creates a green rectangular region at (2, 108) spanning 96 by 73 pixels then Creates a green circular shape at (103, 119) with radius 74.
; PLAN: r0=2(x), r1=108(y), r2=96(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=103(x), r6=119(y), r7=74(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 2
LDI r1, 108
LDI r2, 96
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 119
LDI r7, 74
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
