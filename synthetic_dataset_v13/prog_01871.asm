; DESCRIPTION: Draws a purple line from (215, 156) to (292, 137).
; PLAN: r0=215(x1), r1=156(y1), r2=292(x2), r3=137(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 156
LDI r2, 292
LDI r3, 137
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
