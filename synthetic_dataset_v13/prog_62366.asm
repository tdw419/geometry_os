; DESCRIPTION: Places a green line segment connecting (338, 119) to (402, 74).
; PLAN: r0=338(x1), r1=119(y1), r2=402(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 119
LDI r2, 402
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
