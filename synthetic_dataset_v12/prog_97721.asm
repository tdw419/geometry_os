; DESCRIPTION: Composite: Renders a orange disk with center (341, 170) and radius 28 then Draws a magenta rectangle at (165, 66) with width 35 and height 53.
; PLAN: r0=341(x), r1=170(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=165(x), r6=66(y), r7=35(width), r8=53(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 341
LDI r1, 170
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 165
LDI r6, 66
LDI r7, 35
LDI r8, 53
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
