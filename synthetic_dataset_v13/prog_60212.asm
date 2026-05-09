; DESCRIPTION: Composite: Renders a purple line between points (438, 45) and (373, 148) then Places a blue 101x35 rectangle at position (320, 87) then Renders a black disk with center (196, 212) and radius 33.
; PLAN: r0=438(x1), r1=45(y1), r2=373(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=87(y), r7=101(width), r8=35(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=196(x), r11=212(y), r12=33(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 438
LDI r1, 45
LDI r2, 373
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 87
LDI r7, 101
LDI r8, 35
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 196
LDI r11, 212
LDI r12, 33
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
