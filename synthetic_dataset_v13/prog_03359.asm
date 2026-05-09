; DESCRIPTION: Composite: Places a orange circle of radius 46 at center (121, 132) then Draws a purple line from (325, 93) to (124, 169) then Renders a white box of size 80x87 starting at (44, 11).
; PLAN: r0=121(x), r1=132(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=325(x1), r6=93(y1), r7=124(x2), r8=169(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=44(x), r11=11(y), r12=80(width), r13=87(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 132
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 325
LDI r6, 93
LDI r7, 124
LDI r8, 169
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 44
LDI r11, 11
LDI r12, 80
LDI r13, 87
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
