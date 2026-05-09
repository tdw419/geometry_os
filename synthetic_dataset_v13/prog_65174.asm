; DESCRIPTION: Places a green line segment connecting (427, 204) to (210, 137).
; PLAN: r0=427(x1), r1=204(y1), r2=210(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 204
LDI r2, 210
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
