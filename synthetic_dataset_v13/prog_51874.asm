; DESCRIPTION: Draws a red line from (358, 73) to (76, 116).
; PLAN: r0=358(x1), r1=73(y1), r2=76(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 73
LDI r2, 76
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
