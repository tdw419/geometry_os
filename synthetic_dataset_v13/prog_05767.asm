; DESCRIPTION: Composite: Draws a purple rectangle at (209, 96) with width 107 and height 96 then Places a magenta circle of radius 76 at center (155, 160).
; PLAN: r0=209(x), r1=96(y), r2=107(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=155(x), r6=160(y), r7=76(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 209
LDI r1, 96
LDI r2, 107
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 160
LDI r7, 76
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
