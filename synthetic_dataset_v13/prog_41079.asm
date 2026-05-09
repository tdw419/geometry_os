; DESCRIPTION: Places a white line segment connecting (89, 113) to (491, 147).
; PLAN: r0=89(x1), r1=113(y1), r2=491(x2), r3=147(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 113
LDI r2, 491
LDI r3, 147
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
