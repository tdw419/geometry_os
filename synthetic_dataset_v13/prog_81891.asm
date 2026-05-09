; DESCRIPTION: Places a orange line segment connecting (287, 114) to (393, 144).
; PLAN: r0=287(x1), r1=114(y1), r2=393(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 114
LDI r2, 393
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
