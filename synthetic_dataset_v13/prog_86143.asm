; DESCRIPTION: Composite: Draws a yellow line from (350, 179) to (476, 87) then Creates a green rectangular region at (132, 14) spanning 70 by 115 pixels.
; PLAN: r0=350(x1), r1=179(y1), r2=476(x2), r3=87(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=132(x), r6=14(y), r7=70(width), r8=115(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 350
LDI r1, 179
LDI r2, 476
LDI r3, 87
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 14
LDI r7, 70
LDI r8, 115
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
