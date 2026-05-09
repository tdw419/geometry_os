; DESCRIPTION: Renders a red line between points (450, 160) and (124, 41).
; PLAN: r0=450(x1), r1=160(y1), r2=124(x2), r3=41(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 160
LDI r2, 124
LDI r3, 41
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
