; DESCRIPTION: Renders a red line between points (53, 203) and (191, 77).
; PLAN: r0=53(x1), r1=203(y1), r2=191(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 203
LDI r2, 191
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
