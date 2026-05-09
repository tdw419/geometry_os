; DESCRIPTION: Composite: Renders a blue box of size 26x114 starting at (138, 41) then Draws a magenta circle centered at (391, 194) with radius 30.
; PLAN: r0=138(x), r1=41(y), r2=26(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=391(x), r6=194(y), r7=30(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 138
LDI r1, 41
LDI r2, 26
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 194
LDI r7, 30
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
