; DESCRIPTION: Places a orange line segment connecting (158, 247) to (350, 249).
; PLAN: r0=158(x1), r1=247(y1), r2=350(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 247
LDI r2, 350
LDI r3, 249
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
