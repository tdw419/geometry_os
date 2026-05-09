; DESCRIPTION: Draws a magenta line from (102, 233) to (322, 11).
; PLAN: r0=102(x1), r1=233(y1), r2=322(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 233
LDI r2, 322
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
