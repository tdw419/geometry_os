; DESCRIPTION: Draws a magenta line from (451, 95) to (137, 60).
; PLAN: r0=451(x1), r1=95(y1), r2=137(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 95
LDI r2, 137
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
