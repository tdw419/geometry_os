; DESCRIPTION: Draws a red line from (358, 49) to (118, 14).
; PLAN: r0=358(x1), r1=49(y1), r2=118(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 49
LDI r2, 118
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
