; DESCRIPTION: Renders a red line between points (114, 203) and (413, 77).
; PLAN: r0=114(x1), r1=203(y1), r2=413(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 203
LDI r2, 413
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
