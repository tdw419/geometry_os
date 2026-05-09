; DESCRIPTION: Draws a red line from (119, 53) to (105, 121).
; PLAN: r0=119(x1), r1=53(y1), r2=105(x2), r3=121(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 53
LDI r2, 105
LDI r3, 121
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
