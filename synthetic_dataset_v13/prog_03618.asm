; DESCRIPTION: Composite: Places a blue circle of radius 80 at center (323, 155) then Draws a green line from (11, 185) to (0, 220) then Draws a magenta rectangle at (378, 173) with width 11 and height 23.
; PLAN: r0=323(x), r1=155(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=11(x1), r6=185(y1), r7=0(x2), r8=220(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=378(x), r11=173(y), r12=11(width), r13=23(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 323
LDI r1, 155
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 11
LDI r6, 185
LDI r7, 0
LDI r8, 220
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 173
LDI r12, 11
LDI r13, 23
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
