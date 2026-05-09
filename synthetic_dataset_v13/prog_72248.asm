; DESCRIPTION: Places a orange line segment connecting (177, 229) to (416, 158).
; PLAN: r0=177(x1), r1=229(y1), r2=416(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 229
LDI r2, 416
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
