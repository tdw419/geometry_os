; DESCRIPTION: Places a white line segment connecting (318, 198) to (217, 147).
; PLAN: r0=318(x1), r1=198(y1), r2=217(x2), r3=147(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 198
LDI r2, 217
LDI r3, 147
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
