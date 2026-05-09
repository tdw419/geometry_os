; DESCRIPTION: Draws a red line from (471, 35) to (238, 194).
; PLAN: r0=471(x1), r1=35(y1), r2=238(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 35
LDI r2, 238
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
