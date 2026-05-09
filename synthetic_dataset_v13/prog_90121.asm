; DESCRIPTION: Composite: Creates a green rectangular region at (252, 43) spanning 75 by 61 pixels then Creates a white circular shape at (136, 53) with radius 11.
; PLAN: r0=252(x), r1=43(y), r2=75(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=136(x), r6=53(y), r7=11(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 252
LDI r1, 43
LDI r2, 75
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 53
LDI r7, 11
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
