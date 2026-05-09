; DESCRIPTION: Renders a red line between points (277, 77) and (246, 36).
; PLAN: r0=277(x1), r1=77(y1), r2=246(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 77
LDI r2, 246
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
