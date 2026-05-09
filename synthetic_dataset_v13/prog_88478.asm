; DESCRIPTION: Draws a purple line from (494, 241) to (496, 169).
; PLAN: r0=494(x1), r1=241(y1), r2=496(x2), r3=169(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 241
LDI r2, 496
LDI r3, 169
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
