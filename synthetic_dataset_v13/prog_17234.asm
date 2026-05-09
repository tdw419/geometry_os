; DESCRIPTION: Composite: Renders a green box of size 14x36 starting at (407, 65) then Creates a blue circular shape at (368, 140) with radius 31 then Draws a red line from (337, 201) to (192, 172).
; PLAN: r0=407(x), r1=65(y), r2=14(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x), r6=140(y), r7=31(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=337(x1), r11=201(y1), r12=192(x2), r13=172(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 407
LDI r1, 65
LDI r2, 14
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 140
LDI r7, 31
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 337
LDI r11, 201
LDI r12, 192
LDI r13, 172
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
