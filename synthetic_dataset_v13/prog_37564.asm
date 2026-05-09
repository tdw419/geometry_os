; DESCRIPTION: Renders a red line between points (506, 77) and (77, 68).
; PLAN: r0=506(x1), r1=77(y1), r2=77(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 77
LDI r2, 77
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
