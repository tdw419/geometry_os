; DESCRIPTION: Places a orange line segment connecting (29, 132) to (248, 47).
; PLAN: r0=29(x1), r1=132(y1), r2=248(x2), r3=47(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 132
LDI r2, 248
LDI r3, 47
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
