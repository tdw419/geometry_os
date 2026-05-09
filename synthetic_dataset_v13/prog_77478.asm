; DESCRIPTION: Composite: Draws a yellow circle centered at (349, 64) with radius 39 then Places a blue 49x84 rectangle at position (383, 94).
; PLAN: r0=349(x), r1=64(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=383(x), r6=94(y), r7=49(width), r8=84(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 349
LDI r1, 64
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 383
LDI r6, 94
LDI r7, 49
LDI r8, 84
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
