; DESCRIPTION: Composite: Places a blue 16x20 rectangle at position (480, 84) then Places a purple circle of radius 36 at center (349, 181) then Sets a single black pixel at (279, 137).
; PLAN: r0=480(x), r1=84(y), r2=16(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=349(x), r6=181(y), r7=36(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=279(x), r11=137(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 480
LDI r1, 84
LDI r2, 16
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 181
LDI r7, 36
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 279
LDI r11, 137
LDI r12, 0x000000
PSET r10, r11, r12
HALT
