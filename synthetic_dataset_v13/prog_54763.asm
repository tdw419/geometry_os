; DESCRIPTION: Draws a magenta line from (51, 122) to (466, 238).
; PLAN: r0=51(x1), r1=122(y1), r2=466(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 122
LDI r2, 466
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
