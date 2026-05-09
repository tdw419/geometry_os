; DESCRIPTION: Draws a white line from (118, 34) to (121, 82).
; PLAN: r0=118(x1), r1=34(y1), r2=121(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 34
LDI r2, 121
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
