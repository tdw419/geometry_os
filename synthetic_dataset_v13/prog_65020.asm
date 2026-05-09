; DESCRIPTION: Composite: Creates a white circular shape at (413, 176) with radius 68 then Draws a green rectangle at (217, 14) with width 118 and height 116.
; PLAN: r0=413(x), r1=176(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=217(x), r6=14(y), r7=118(width), r8=116(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 413
LDI r1, 176
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 217
LDI r6, 14
LDI r7, 118
LDI r8, 116
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
