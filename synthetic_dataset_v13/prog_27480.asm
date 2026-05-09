; DESCRIPTION: Renders a red line between points (89, 183) and (246, 144).
; PLAN: r0=89(x1), r1=183(y1), r2=246(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 183
LDI r2, 246
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
