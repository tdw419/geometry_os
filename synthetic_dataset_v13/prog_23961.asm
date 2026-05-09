; DESCRIPTION: Draws a magenta line from (204, 187) to (448, 72).
; PLAN: r0=204(x1), r1=187(y1), r2=448(x2), r3=72(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 187
LDI r2, 448
LDI r3, 72
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
