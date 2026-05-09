; DESCRIPTION: Draws a magenta line from (51, 155) to (383, 21).
; PLAN: r0=51(x1), r1=155(y1), r2=383(x2), r3=21(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 155
LDI r2, 383
LDI r3, 21
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
