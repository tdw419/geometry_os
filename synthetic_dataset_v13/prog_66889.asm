; DESCRIPTION: Composite: Creates a blue circular shape at (297, 186) with radius 70 then Creates a white rectangular region at (31, 130) spanning 81 by 67 pixels.
; PLAN: r0=297(x), r1=186(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=31(x), r6=130(y), r7=81(width), r8=67(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 297
LDI r1, 186
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 31
LDI r6, 130
LDI r7, 81
LDI r8, 67
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
