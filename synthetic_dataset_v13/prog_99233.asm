; DESCRIPTION: Renders a red line between points (454, 162) and (123, 203).
; PLAN: r0=454(x1), r1=162(y1), r2=123(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 162
LDI r2, 123
LDI r3, 203
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
