; DESCRIPTION: Draws a magenta line from (351, 75) to (51, 229).
; PLAN: r0=351(x1), r1=75(y1), r2=51(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 75
LDI r2, 51
LDI r3, 229
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
