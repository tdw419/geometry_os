; DESCRIPTION: Composite: Renders a yellow line between points (269, 174) and (359, 174) then Places a purple 43x57 rectangle at position (6, 171) then Places a black circle of radius 70 at center (287, 161).
; PLAN: r0=269(x1), r1=174(y1), r2=359(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=6(x), r6=171(y), r7=43(width), r8=57(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=287(x), r11=161(y), r12=70(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 269
LDI r1, 174
LDI r2, 359
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 171
LDI r7, 43
LDI r8, 57
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 287
LDI r11, 161
LDI r12, 70
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
