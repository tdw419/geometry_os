; DESCRIPTION: Places a yellow line segment connecting (208, 232) to (287, 30).
; PLAN: r0=208(x1), r1=232(y1), r2=287(x2), r3=30(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 232
LDI r2, 287
LDI r3, 30
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
