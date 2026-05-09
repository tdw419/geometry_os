; DESCRIPTION: Draws a red line from (377, 11) to (249, 121).
; PLAN: r0=377(x1), r1=11(y1), r2=249(x2), r3=121(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 11
LDI r2, 249
LDI r3, 121
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
