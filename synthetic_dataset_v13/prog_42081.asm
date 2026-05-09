; DESCRIPTION: Renders a red line between points (338, 133) and (65, 57).
; PLAN: r0=338(x1), r1=133(y1), r2=65(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 133
LDI r2, 65
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
