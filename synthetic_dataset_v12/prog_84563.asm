; DESCRIPTION: Composite: Creates a orange circular shape at (98, 81) with radius 33 then Draws a white rectangle at (311, 78) with width 114 and height 102.
; PLAN: r0=98(x), r1=81(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=311(x), r6=78(y), r7=114(width), r8=102(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 81
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 311
LDI r6, 78
LDI r7, 114
LDI r8, 102
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
