; DESCRIPTION: Composite: Draws a purple rectangle at (223, 121) with width 29 and height 31 then Places a purple circle of radius 15 at center (374, 216) then Places a black dot at position (416, 44).
; PLAN: r0=223(x), r1=121(y), r2=29(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=374(x), r6=216(y), r7=15(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=416(x), r11=44(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 223
LDI r1, 121
LDI r2, 29
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 216
LDI r7, 15
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 416
LDI r11, 44
LDI r12, 0x000000
PSET r10, r11, r12
HALT
