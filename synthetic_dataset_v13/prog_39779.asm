; DESCRIPTION: Places a orange line segment connecting (19, 150) to (147, 99).
; PLAN: r0=19(x1), r1=150(y1), r2=147(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 150
LDI r2, 147
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
