; DESCRIPTION: Composite: Renders a green box of size 30x80 starting at (397, 95) then Draws a yellow line from (132, 188) to (402, 181) then Sets a single red pixel at (148, 37).
; PLAN: r0=397(x), r1=95(y), r2=30(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=132(x1), r6=188(y1), r7=402(x2), r8=181(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=148(x), r11=37(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 397
LDI r1, 95
LDI r2, 30
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 188
LDI r7, 402
LDI r8, 181
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 148
LDI r11, 37
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
