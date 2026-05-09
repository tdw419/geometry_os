; DESCRIPTION: Composite: Draws a green rectangle at (396, 29) with width 85 and height 28 then Places a green circle of radius 19 at center (310, 137).
; PLAN: r0=396(x), r1=29(y), r2=85(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=310(x), r6=137(y), r7=19(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 396
LDI r1, 29
LDI r2, 85
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 137
LDI r7, 19
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
