; DESCRIPTION: Draws a purple line from (292, 92) to (367, 158).
; PLAN: r0=292(x1), r1=92(y1), r2=367(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 92
LDI r2, 367
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
