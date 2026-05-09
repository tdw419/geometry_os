; DESCRIPTION: Composite: Places a cyan dot at position (419, 152) then Places a blue circle of radius 49 at center (326, 139) then Draws a purple rectangle at (279, 136) with width 62 and height 101.
; PLAN: r0=419(x), r1=152(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=326(x), r6=139(y), r7=49(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=279(x), r11=136(y), r12=62(width), r13=101(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 419
LDI r1, 152
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 326
LDI r6, 139
LDI r7, 49
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 279
LDI r11, 136
LDI r12, 62
LDI r13, 101
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
