; DESCRIPTION: Draws a red line from (471, 119) to (148, 248).
; PLAN: r0=471(x1), r1=119(y1), r2=148(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 119
LDI r2, 148
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
