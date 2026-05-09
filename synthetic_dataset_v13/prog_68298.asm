; DESCRIPTION: Places a white line segment connecting (277, 147) to (357, 2).
; PLAN: r0=277(x1), r1=147(y1), r2=357(x2), r3=2(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 147
LDI r2, 357
LDI r3, 2
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
