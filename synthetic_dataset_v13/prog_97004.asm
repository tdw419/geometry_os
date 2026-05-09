; DESCRIPTION: Composite: Draws a red rectangle at (232, 75) with width 105 and height 58 then Renders a black disk with center (189, 150) and radius 72.
; PLAN: r0=232(x), r1=75(y), r2=105(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=189(x), r6=150(y), r7=72(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 232
LDI r1, 75
LDI r2, 105
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 150
LDI r7, 72
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
