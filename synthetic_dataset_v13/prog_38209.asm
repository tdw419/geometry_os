; DESCRIPTION: Renders a red line between points (156, 121) and (141, 163).
; PLAN: r0=156(x1), r1=121(y1), r2=141(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 121
LDI r2, 141
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
