; DESCRIPTION: Composite: Places a orange circle of radius 43 at center (167, 101) then Draws a black rectangle at (268, 62) with width 49 and height 49.
; PLAN: r0=167(x), r1=101(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=268(x), r6=62(y), r7=49(width), r8=49(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 167
LDI r1, 101
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 268
LDI r6, 62
LDI r7, 49
LDI r8, 49
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
