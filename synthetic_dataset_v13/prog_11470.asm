; DESCRIPTION: Places a yellow line segment connecting (323, 145) to (429, 191).
; PLAN: r0=323(x1), r1=145(y1), r2=429(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 145
LDI r2, 429
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
