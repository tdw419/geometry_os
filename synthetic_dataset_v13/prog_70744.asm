; DESCRIPTION: Renders a red line between points (12, 183) and (99, 65).
; PLAN: r0=12(x1), r1=183(y1), r2=99(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 183
LDI r2, 99
LDI r3, 65
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
