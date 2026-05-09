; DESCRIPTION: Renders a red line between points (203, 157) and (9, 72).
; PLAN: r0=203(x1), r1=157(y1), r2=9(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 157
LDI r2, 9
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
