; DESCRIPTION: Renders a red line between points (92, 119) and (179, 53).
; PLAN: r0=92(x1), r1=119(y1), r2=179(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 119
LDI r2, 179
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
