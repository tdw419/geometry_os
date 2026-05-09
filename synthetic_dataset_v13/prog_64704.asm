; DESCRIPTION: Composite: Draws a black rectangle at (163, 41) with width 62 and height 95 then Places a magenta circle of radius 13 at center (103, 13).
; PLAN: r0=163(x), r1=41(y), r2=62(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=103(x), r6=13(y), r7=13(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 163
LDI r1, 41
LDI r2, 62
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 13
LDI r7, 13
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
