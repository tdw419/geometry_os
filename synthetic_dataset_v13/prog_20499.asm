; DESCRIPTION: Places a green line segment connecting (72, 252) to (266, 191).
; PLAN: r0=72(x1), r1=252(y1), r2=266(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 252
LDI r2, 266
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
