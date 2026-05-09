; DESCRIPTION: Composite: Creates a white rectangular region at (1, 167) spanning 12 by 68 pixels then Creates a white circular shape at (123, 130) with radius 16.
; PLAN: r0=1(x), r1=167(y), r2=12(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x), r6=130(y), r7=16(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 1
LDI r1, 167
LDI r2, 12
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 130
LDI r7, 16
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
