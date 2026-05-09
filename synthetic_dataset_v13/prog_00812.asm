; DESCRIPTION: Draws a magenta line from (112, 238) to (472, 241).
; PLAN: r0=112(x1), r1=238(y1), r2=472(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 238
LDI r2, 472
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
