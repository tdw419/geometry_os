; DESCRIPTION: Draws a purple line from (414, 47) to (452, 114).
; PLAN: r0=414(x1), r1=47(y1), r2=452(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 47
LDI r2, 452
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
