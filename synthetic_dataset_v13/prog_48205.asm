; DESCRIPTION: Draws a magenta line from (322, 58) to (449, 159).
; PLAN: r0=322(x1), r1=58(y1), r2=449(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 58
LDI r2, 449
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
