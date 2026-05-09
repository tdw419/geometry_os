; DESCRIPTION: Composite: Renders a blue box of size 90x87 starting at (234, 8) then Sets a single red pixel at (105, 211) then Draws a green line from (376, 97) to (84, 220).
; PLAN: r0=234(x), r1=8(y), r2=90(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=105(x), r6=211(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=376(x1), r11=97(y1), r12=84(x2), r13=220(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 234
LDI r1, 8
LDI r2, 90
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 211
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 376
LDI r11, 97
LDI r12, 84
LDI r13, 220
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
