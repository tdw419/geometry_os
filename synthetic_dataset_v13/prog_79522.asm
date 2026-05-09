; DESCRIPTION: Renders a red line between points (112, 82) and (212, 81).
; PLAN: r0=112(x1), r1=82(y1), r2=212(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 82
LDI r2, 212
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
