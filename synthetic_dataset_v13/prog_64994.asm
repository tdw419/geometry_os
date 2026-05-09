; DESCRIPTION: Composite: Creates a orange circular shape at (89, 84) with radius 38 then Places a purple dot at position (185, 164) then Draws a green rectangle at (106, 216) with width 23 and height 10.
; PLAN: r0=89(x), r1=84(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=185(x), r6=164(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=106(x), r11=216(y), r12=23(width), r13=10(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 84
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 185
LDI r6, 164
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 106
LDI r11, 216
LDI r12, 23
LDI r13, 10
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
