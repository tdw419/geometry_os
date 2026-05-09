; DESCRIPTION: Composite: Draws a blue rectangle at (378, 73) with width 105 and height 39 then Places a blue circle of radius 44 at center (306, 136).
; PLAN: r0=378(x), r1=73(y), r2=105(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=306(x), r6=136(y), r7=44(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 378
LDI r1, 73
LDI r2, 105
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 136
LDI r7, 44
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
