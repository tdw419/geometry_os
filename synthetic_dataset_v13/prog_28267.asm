; DESCRIPTION: Composite: Draws a magenta rectangle at (110, 125) with width 105 and height 95 then Renders a black disk with center (203, 41) and radius 41.
; PLAN: r0=110(x), r1=125(y), r2=105(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=203(x), r6=41(y), r7=41(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 110
LDI r1, 125
LDI r2, 105
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 41
LDI r7, 41
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
