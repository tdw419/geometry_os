; DESCRIPTION: Places a yellow line segment connecting (87, 52) to (396, 137).
; PLAN: r0=87(x1), r1=52(y1), r2=396(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 52
LDI r2, 396
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
