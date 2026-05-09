; DESCRIPTION: Renders a red line between points (51, 92) and (456, 81).
; PLAN: r0=51(x1), r1=92(y1), r2=456(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 92
LDI r2, 456
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
