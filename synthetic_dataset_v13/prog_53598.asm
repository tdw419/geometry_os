; DESCRIPTION: Places a orange line segment connecting (263, 147) to (454, 17).
; PLAN: r0=263(x1), r1=147(y1), r2=454(x2), r3=17(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 147
LDI r2, 454
LDI r3, 17
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
