; DESCRIPTION: Composite: Draws a blue rectangle at (225, 97) with width 36 and height 49 then Places a blue circle of radius 51 at center (117, 82).
; PLAN: r0=225(x), r1=97(y), r2=36(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=117(x), r6=82(y), r7=51(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 225
LDI r1, 97
LDI r2, 36
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 82
LDI r7, 51
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
