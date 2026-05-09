; DESCRIPTION: Draws a blue line from (452, 241) to (368, 73).
; PLAN: r0=452(x1), r1=241(y1), r2=368(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 241
LDI r2, 368
LDI r3, 73
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
