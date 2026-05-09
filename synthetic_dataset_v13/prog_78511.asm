; DESCRIPTION: Draws a red line from (82, 153) to (358, 138).
; PLAN: r0=82(x1), r1=153(y1), r2=358(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 153
LDI r2, 358
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
