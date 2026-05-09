; DESCRIPTION: Renders a red line between points (377, 49) and (501, 14).
; PLAN: r0=377(x1), r1=49(y1), r2=501(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 49
LDI r2, 501
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
