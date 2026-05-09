; DESCRIPTION: Draws a purple line from (358, 229) to (356, 53).
; PLAN: r0=358(x1), r1=229(y1), r2=356(x2), r3=53(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 229
LDI r2, 356
LDI r3, 53
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
