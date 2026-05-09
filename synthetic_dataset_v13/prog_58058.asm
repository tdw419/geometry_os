; DESCRIPTION: Renders a red line between points (451, 109) and (82, 162).
; PLAN: r0=451(x1), r1=109(y1), r2=82(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 109
LDI r2, 82
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
