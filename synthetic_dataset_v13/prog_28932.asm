; DESCRIPTION: Renders a red line between points (133, 221) and (102, 141).
; PLAN: r0=133(x1), r1=221(y1), r2=102(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 221
LDI r2, 102
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
