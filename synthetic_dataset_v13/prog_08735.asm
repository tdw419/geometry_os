; DESCRIPTION: Composite: Renders a blue line between points (45, 110) and (7, 84) then Draws a purple circle centered at (410, 236) with radius 20 then Places a yellow 117x63 rectangle at position (195, 148).
; PLAN: r0=45(x1), r1=110(y1), r2=7(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=410(x), r6=236(y), r7=20(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=195(x), r11=148(y), r12=117(width), r13=63(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 45
LDI r1, 110
LDI r2, 7
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 236
LDI r7, 20
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 195
LDI r11, 148
LDI r12, 117
LDI r13, 63
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
