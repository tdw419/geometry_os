; DESCRIPTION: Composite: Draws a orange circle centered at (339, 162) with radius 62 then Draws a black rectangle at (376, 177) with width 77 and height 68.
; PLAN: r0=339(x), r1=162(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=376(x), r6=177(y), r7=77(width), r8=68(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 339
LDI r1, 162
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 376
LDI r6, 177
LDI r7, 77
LDI r8, 68
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
