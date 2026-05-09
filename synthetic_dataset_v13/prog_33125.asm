; DESCRIPTION: Places a magenta line segment connecting (36, 51) to (90, 212).
; PLAN: r0=36(x1), r1=51(y1), r2=90(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 51
LDI r2, 90
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
