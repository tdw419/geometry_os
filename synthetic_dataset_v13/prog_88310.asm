; DESCRIPTION: Composite: Renders a purple line between points (388, 255) and (106, 219) then Places a black 100x22 rectangle at position (367, 108) then Places a green circle of radius 20 at center (338, 159).
; PLAN: r0=388(x1), r1=255(y1), r2=106(x2), r3=219(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=367(x), r6=108(y), r7=100(width), r8=22(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=338(x), r11=159(y), r12=20(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 388
LDI r1, 255
LDI r2, 106
LDI r3, 219
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 108
LDI r7, 100
LDI r8, 22
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 338
LDI r11, 159
LDI r12, 20
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
