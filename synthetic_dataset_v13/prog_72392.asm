; DESCRIPTION: Draws a magenta line from (493, 232) to (471, 35).
; PLAN: r0=493(x1), r1=232(y1), r2=471(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 232
LDI r2, 471
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
