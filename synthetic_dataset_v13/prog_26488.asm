; DESCRIPTION: Renders a red line between points (18, 216) and (89, 46).
; PLAN: r0=18(x1), r1=216(y1), r2=89(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 216
LDI r2, 89
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
