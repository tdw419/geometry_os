; DESCRIPTION: Composite: Draws a yellow rectangle at (233, 141) with width 29 and height 79 then Places a orange dot at position (230, 45) then Places a purple circle of radius 30 at center (393, 218).
; PLAN: r0=233(x), r1=141(y), r2=29(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=230(x), r6=45(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=393(x), r11=218(y), r12=30(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 233
LDI r1, 141
LDI r2, 29
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 45
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 393
LDI r11, 218
LDI r12, 30
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
