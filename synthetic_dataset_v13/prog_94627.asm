; DESCRIPTION: Places a orange line segment connecting (455, 227) to (249, 251).
; PLAN: r0=455(x1), r1=227(y1), r2=249(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 227
LDI r2, 249
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
