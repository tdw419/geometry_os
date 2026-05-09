; DESCRIPTION: Draws a magenta line from (89, 131) to (151, 90).
; PLAN: r0=89(x1), r1=131(y1), r2=151(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 131
LDI r2, 151
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
