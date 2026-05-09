; DESCRIPTION: Renders a red line between points (485, 15) and (462, 223).
; PLAN: r0=485(x1), r1=15(y1), r2=462(x2), r3=223(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 15
LDI r2, 462
LDI r3, 223
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
