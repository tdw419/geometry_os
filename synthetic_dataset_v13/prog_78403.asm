; DESCRIPTION: Renders a red line between points (426, 190) and (138, 140).
; PLAN: r0=426(x1), r1=190(y1), r2=138(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 190
LDI r2, 138
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
