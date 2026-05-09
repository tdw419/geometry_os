; DESCRIPTION: Composite: Creates a white circular shape at (399, 42) with radius 15 then Draws a white rectangle at (336, 50) with width 87 and height 118.
; PLAN: r0=399(x), r1=42(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=336(x), r6=50(y), r7=87(width), r8=118(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 399
LDI r1, 42
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 336
LDI r6, 50
LDI r7, 87
LDI r8, 118
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
