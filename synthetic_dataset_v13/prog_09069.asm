; DESCRIPTION: Places a yellow line segment connecting (474, 252) to (407, 216).
; PLAN: r0=474(x1), r1=252(y1), r2=407(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 252
LDI r2, 407
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
