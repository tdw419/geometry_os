; DESCRIPTION: Renders a red line between points (501, 80) and (200, 203).
; PLAN: r0=501(x1), r1=80(y1), r2=200(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 80
LDI r2, 200
LDI r3, 203
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
