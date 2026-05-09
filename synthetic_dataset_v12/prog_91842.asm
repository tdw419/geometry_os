; DESCRIPTION: Draws a purple line from (511, 100) to (376, 234).
; PLAN: r0=511(x1), r1=100(y1), r2=376(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 100
LDI r2, 376
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
