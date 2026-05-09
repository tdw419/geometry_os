; DESCRIPTION: Composite: Renders a purple line between points (87, 126) and (107, 155) then Places a orange circle of radius 23 at center (185, 150) then Creates a purple rectangular region at (326, 126) spanning 34 by 82 pixels.
; PLAN: r0=87(x1), r1=126(y1), r2=107(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=150(y), r7=23(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=326(x), r11=126(y), r12=34(width), r13=82(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 126
LDI r2, 107
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 150
LDI r7, 23
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 326
LDI r11, 126
LDI r12, 34
LDI r13, 82
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
