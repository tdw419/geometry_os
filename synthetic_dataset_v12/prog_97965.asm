; DESCRIPTION: Places a yellow line segment connecting (377, 226) to (252, 2).
; PLAN: r0=377(x1), r1=226(y1), r2=252(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 226
LDI r2, 252
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
