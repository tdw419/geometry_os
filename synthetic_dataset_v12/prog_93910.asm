; DESCRIPTION: Composite: Renders a black disk with center (232, 76) and radius 67 then Draws a green rectangle at (357, 182) with width 78 and height 63.
; PLAN: r0=232(x), r1=76(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=357(x), r6=182(y), r7=78(width), r8=63(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 232
LDI r1, 76
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 357
LDI r6, 182
LDI r7, 78
LDI r8, 63
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
