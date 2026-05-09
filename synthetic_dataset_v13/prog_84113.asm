; DESCRIPTION: Composite: Creates a orange circular shape at (343, 96) with radius 80 then Draws a green rectangle at (126, 80) with width 16 and height 97.
; PLAN: r0=343(x), r1=96(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=126(x), r6=80(y), r7=16(width), r8=97(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 343
LDI r1, 96
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 126
LDI r6, 80
LDI r7, 16
LDI r8, 97
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
