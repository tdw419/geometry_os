; DESCRIPTION: Renders a red line between points (388, 37) and (93, 162).
; PLAN: r0=388(x1), r1=37(y1), r2=93(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 37
LDI r2, 93
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
