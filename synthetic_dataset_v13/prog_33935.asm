; DESCRIPTION: Composite: Places a blue dot at position (22, 144) then Draws a yellow line from (200, 198) to (323, 18) then Creates a white rectangular region at (263, 87) spanning 16 by 43 pixels.
; PLAN: r0=22(x), r1=144(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=200(x1), r6=198(y1), r7=323(x2), r8=18(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=263(x), r11=87(y), r12=16(width), r13=43(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 22
LDI r1, 144
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 200
LDI r6, 198
LDI r7, 323
LDI r8, 18
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 263
LDI r11, 87
LDI r12, 16
LDI r13, 43
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
