; DESCRIPTION: Composite: Creates a yellow rectangular region at (154, 43) spanning 28 by 26 pixels then Creates a white circular shape at (201, 178) with radius 62.
; PLAN: r0=154(x), r1=43(y), r2=28(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=201(x), r6=178(y), r7=62(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 154
LDI r1, 43
LDI r2, 28
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 178
LDI r7, 62
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
