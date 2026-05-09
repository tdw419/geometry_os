; DESCRIPTION: Draws a blue line from (496, 212) to (388, 189).
; PLAN: r0=496(x1), r1=212(y1), r2=388(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 212
LDI r2, 388
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
