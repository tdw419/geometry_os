; DESCRIPTION: Composite: Draws a cyan rectangle at (281, 178) with width 61 and height 52 then Creates a green circular shape at (253, 158) with radius 68.
; PLAN: r0=281(x), r1=178(y), r2=61(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=253(x), r6=158(y), r7=68(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 281
LDI r1, 178
LDI r2, 61
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 158
LDI r7, 68
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
