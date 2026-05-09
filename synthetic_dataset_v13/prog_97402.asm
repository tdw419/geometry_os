; DESCRIPTION: Composite: Draws a yellow line from (344, 193) to (302, 210) then Renders a black box of size 55x45 starting at (91, 89) then Places a purple circle of radius 63 at center (385, 192).
; PLAN: r0=344(x1), r1=193(y1), r2=302(x2), r3=210(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=91(x), r6=89(y), r7=55(width), r8=45(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=385(x), r11=192(y), r12=63(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 344
LDI r1, 193
LDI r2, 302
LDI r3, 210
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 89
LDI r7, 55
LDI r8, 45
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 385
LDI r11, 192
LDI r12, 63
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
