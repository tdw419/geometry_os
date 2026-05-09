; DESCRIPTION: Draws a red line from (292, 157) to (51, 185).
; PLAN: r0=292(x1), r1=157(y1), r2=51(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 157
LDI r2, 51
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
