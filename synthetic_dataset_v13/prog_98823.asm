; DESCRIPTION: Places a magenta line segment connecting (419, 51) to (170, 153).
; PLAN: r0=419(x1), r1=51(y1), r2=170(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 51
LDI r2, 170
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
