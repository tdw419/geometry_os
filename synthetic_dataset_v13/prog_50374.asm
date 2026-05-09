; DESCRIPTION: Composite: Draws a white rectangle at (341, 15) with width 76 and height 62 then Renders a magenta disk with center (339, 123) and radius 60.
; PLAN: r0=341(x), r1=15(y), r2=76(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=339(x), r6=123(y), r7=60(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 341
LDI r1, 15
LDI r2, 76
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 123
LDI r7, 60
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
