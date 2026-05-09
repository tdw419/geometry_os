; DESCRIPTION: Places a magenta line segment connecting (323, 52) to (143, 65).
; PLAN: r0=323(x1), r1=52(y1), r2=143(x2), r3=65(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 52
LDI r2, 143
LDI r3, 65
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
