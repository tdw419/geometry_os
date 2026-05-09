; DESCRIPTION: Composite: Places a blue 35x67 rectangle at position (232, 181) then Places a purple circle of radius 47 at center (351, 62).
; PLAN: r0=232(x), r1=181(y), r2=35(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=351(x), r6=62(y), r7=47(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 232
LDI r1, 181
LDI r2, 35
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 62
LDI r7, 47
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
