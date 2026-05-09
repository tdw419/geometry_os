; DESCRIPTION: Draws a red line from (3, 121) to (194, 51).
; PLAN: r0=3(x1), r1=121(y1), r2=194(x2), r3=51(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 121
LDI r2, 194
LDI r3, 51
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
