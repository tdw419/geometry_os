; DESCRIPTION: Composite: Creates a magenta circular shape at (49, 90) with radius 24 then Sets a single red pixel at (97, 58) then Draws a blue line from (54, 200) to (147, 50).
; PLAN: r0=49(x), r1=90(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=97(x), r6=58(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=54(x1), r11=200(y1), r12=147(x2), r13=50(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 49
LDI r1, 90
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 97
LDI r6, 58
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 54
LDI r11, 200
LDI r12, 147
LDI r13, 50
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
