; DESCRIPTION: Places a white line segment connecting (74, 218) to (33, 147).
; PLAN: r0=74(x1), r1=218(y1), r2=33(x2), r3=147(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 218
LDI r2, 33
LDI r3, 147
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
