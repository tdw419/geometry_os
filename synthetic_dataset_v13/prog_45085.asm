; DESCRIPTION: Places a white line segment connecting (191, 227) to (273, 56).
; PLAN: r0=191(x1), r1=227(y1), r2=273(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 227
LDI r2, 273
LDI r3, 56
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
