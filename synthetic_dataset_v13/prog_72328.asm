; DESCRIPTION: Composite: Renders a blue disk with center (306, 101) and radius 28 then Draws a orange rectangle at (126, 114) with width 47 and height 78.
; PLAN: r0=306(x), r1=101(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=126(x), r6=114(y), r7=47(width), r8=78(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 306
LDI r1, 101
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 126
LDI r6, 114
LDI r7, 47
LDI r8, 78
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
