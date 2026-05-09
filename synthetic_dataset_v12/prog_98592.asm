; DESCRIPTION: Draws a magenta line from (110, 61) to (322, 112).
; PLAN: r0=110(x1), r1=61(y1), r2=322(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 61
LDI r2, 322
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
