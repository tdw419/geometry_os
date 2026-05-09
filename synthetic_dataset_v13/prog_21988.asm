; DESCRIPTION: Composite: Draws a purple rectangle at (183, 153) with width 19 and height 29 then Places a green circle of radius 35 at center (181, 91).
; PLAN: r0=183(x), r1=153(y), r2=19(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=181(x), r6=91(y), r7=35(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 183
LDI r1, 153
LDI r2, 19
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 91
LDI r7, 35
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
