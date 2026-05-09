; DESCRIPTION: Renders a red line between points (323, 81) and (485, 10).
; PLAN: r0=323(x1), r1=81(y1), r2=485(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 81
LDI r2, 485
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
