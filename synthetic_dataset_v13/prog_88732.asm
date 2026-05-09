; DESCRIPTION: Draws a blue line from (452, 202) to (51, 212).
; PLAN: r0=452(x1), r1=202(y1), r2=51(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 202
LDI r2, 51
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
