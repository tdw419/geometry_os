; DESCRIPTION: Composite: Draws a purple line from (400, 102) to (477, 169) then Renders a orange disk with center (119, 231) and radius 14 then Places a purple 24x85 rectangle at position (426, 21).
; PLAN: r0=400(x1), r1=102(y1), r2=477(x2), r3=169(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=119(x), r6=231(y), r7=14(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=426(x), r11=21(y), r12=24(width), r13=85(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 400
LDI r1, 102
LDI r2, 477
LDI r3, 169
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 231
LDI r7, 14
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 426
LDI r11, 21
LDI r12, 24
LDI r13, 85
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
