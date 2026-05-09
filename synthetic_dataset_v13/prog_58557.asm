; DESCRIPTION: Renders a red line between points (373, 90) and (252, 246).
; PLAN: r0=373(x1), r1=90(y1), r2=252(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 90
LDI r2, 252
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
