; DESCRIPTION: Renders a red line between points (42, 174) and (65, 116).
; PLAN: r0=42(x1), r1=174(y1), r2=65(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 174
LDI r2, 65
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
