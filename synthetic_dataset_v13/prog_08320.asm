; DESCRIPTION: Draws a blue line from (414, 163) to (246, 121).
; PLAN: r0=414(x1), r1=163(y1), r2=246(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 163
LDI r2, 246
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
