; DESCRIPTION: Renders a red line between points (68, 14) and (400, 9).
; PLAN: r0=68(x1), r1=14(y1), r2=400(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 14
LDI r2, 400
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
