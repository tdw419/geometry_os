; DESCRIPTION: Renders a red line between points (395, 62) and (15, 47).
; PLAN: r0=395(x1), r1=62(y1), r2=15(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 62
LDI r2, 15
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
