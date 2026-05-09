; DESCRIPTION: Places a blue line segment connecting (323, 252) to (510, 102).
; PLAN: r0=323(x1), r1=252(y1), r2=510(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 252
LDI r2, 510
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
