; DESCRIPTION: Composite: Draws a black rectangle at (421, 2) with width 80 and height 118 then Renders a red disk with center (62, 142) and radius 54.
; PLAN: r0=421(x), r1=2(y), r2=80(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=62(x), r6=142(y), r7=54(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 421
LDI r1, 2
LDI r2, 80
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 142
LDI r7, 54
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
