; DESCRIPTION: Draws a purple line from (429, 63) to (313, 12).
; PLAN: r0=429(x1), r1=63(y1), r2=313(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 63
LDI r2, 313
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
