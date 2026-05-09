; DESCRIPTION: Places a green line segment connecting (402, 72) to (395, 123).
; PLAN: r0=402(x1), r1=72(y1), r2=395(x2), r3=123(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 72
LDI r2, 395
LDI r3, 123
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
