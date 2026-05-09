; DESCRIPTION: Composite: Creates a white rectangular region at (31, 136) spanning 24 by 14 pixels then Renders a magenta disk with center (88, 108) and radius 80.
; PLAN: r0=31(x), r1=136(y), r2=24(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=88(x), r6=108(y), r7=80(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 31
LDI r1, 136
LDI r2, 24
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 108
LDI r7, 80
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
