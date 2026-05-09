; DESCRIPTION: Composite: Renders a yellow line between points (39, 246) and (461, 3) then Places a blue circle of radius 36 at center (149, 219) then Places a yellow 117x11 rectangle at position (90, 200).
; PLAN: r0=39(x1), r1=246(y1), r2=461(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=149(x), r6=219(y), r7=36(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=90(x), r11=200(y), r12=117(width), r13=11(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 39
LDI r1, 246
LDI r2, 461
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 219
LDI r7, 36
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 90
LDI r11, 200
LDI r12, 117
LDI r13, 11
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
