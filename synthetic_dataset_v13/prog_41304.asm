; DESCRIPTION: Places a green line segment connecting (430, 52) to (427, 198).
; PLAN: r0=430(x1), r1=52(y1), r2=427(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 52
LDI r2, 427
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
