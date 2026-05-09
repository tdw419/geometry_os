; DESCRIPTION: Renders a red line between points (22, 92) and (394, 133).
; PLAN: r0=22(x1), r1=92(y1), r2=394(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 92
LDI r2, 394
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
