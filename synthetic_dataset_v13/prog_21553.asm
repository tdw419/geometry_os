; DESCRIPTION: Composite: Places a yellow circle of radius 50 at center (396, 200) then Creates a purple rectangular region at (44, 125) spanning 55 by 23 pixels then Renders a purple line between points (317, 34) and (350, 208).
; PLAN: r0=396(x), r1=200(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=44(x), r6=125(y), r7=55(width), r8=23(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=317(x1), r11=34(y1), r12=350(x2), r13=208(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 396
LDI r1, 200
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 44
LDI r6, 125
LDI r7, 55
LDI r8, 23
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 317
LDI r11, 34
LDI r12, 350
LDI r13, 208
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
