; DESCRIPTION: Composite: Draws a purple circle centered at (359, 89) with radius 64 then Renders a black line between points (184, 45) and (374, 23) then Places a magenta 117x35 rectangle at position (159, 62).
; PLAN: r0=359(x), r1=89(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=184(x1), r6=45(y1), r7=374(x2), r8=23(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=159(x), r11=62(y), r12=117(width), r13=35(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 359
LDI r1, 89
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 184
LDI r6, 45
LDI r7, 374
LDI r8, 23
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 159
LDI r11, 62
LDI r12, 117
LDI r13, 35
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
