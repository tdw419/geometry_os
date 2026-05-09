; DESCRIPTION: Places a yellow line segment connecting (43, 36) to (429, 97).
; PLAN: r0=43(x1), r1=36(y1), r2=429(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 36
LDI r2, 429
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
