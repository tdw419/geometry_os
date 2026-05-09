; DESCRIPTION: Draws a black line from (466, 241) to (377, 77).
; PLAN: r0=466(x1), r1=241(y1), r2=377(x2), r3=77(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 241
LDI r2, 377
LDI r3, 77
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
