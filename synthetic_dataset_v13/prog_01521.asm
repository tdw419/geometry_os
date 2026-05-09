; DESCRIPTION: Draws a blue line from (422, 118) to (203, 63).
; PLAN: r0=422(x1), r1=118(y1), r2=203(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 118
LDI r2, 203
LDI r3, 63
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
