; DESCRIPTION: Places a black line segment connecting (395, 124) to (252, 137).
; PLAN: r0=395(x1), r1=124(y1), r2=252(x2), r3=137(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 124
LDI r2, 252
LDI r3, 137
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
