; DESCRIPTION: Composite: Places a blue 111x49 rectangle at position (291, 6) then Draws a purple circle centered at (327, 84) with radius 51.
; PLAN: r0=291(x), r1=6(y), r2=111(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=327(x), r6=84(y), r7=51(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 291
LDI r1, 6
LDI r2, 111
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 84
LDI r7, 51
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
