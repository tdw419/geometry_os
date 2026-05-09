; DESCRIPTION: Draws a black line from (466, 147) to (134, 116).
; PLAN: r0=466(x1), r1=147(y1), r2=134(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 147
LDI r2, 134
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
