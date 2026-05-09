; DESCRIPTION: Composite: Renders a blue disk with center (490, 48) and radius 19 then Places a red dot at position (475, 231) then Draws a yellow rectangle at (280, 47) with width 105 and height 94.
; PLAN: r0=490(x), r1=48(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=475(x), r6=231(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=280(x), r11=47(y), r12=105(width), r13=94(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 490
LDI r1, 48
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 475
LDI r6, 231
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 280
LDI r11, 47
LDI r12, 105
LDI r13, 94
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
