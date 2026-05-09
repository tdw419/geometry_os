; DESCRIPTION: Draws a purple line from (429, 91) to (9, 36).
; PLAN: r0=429(x1), r1=91(y1), r2=9(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 91
LDI r2, 9
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
