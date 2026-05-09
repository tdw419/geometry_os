; DESCRIPTION: Draws a red line from (511, 34) to (413, 79).
; PLAN: r0=511(x1), r1=34(y1), r2=413(x2), r3=79(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 34
LDI r2, 413
LDI r3, 79
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
