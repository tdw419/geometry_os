; DESCRIPTION: Renders a red line between points (20, 88) and (6, 47).
; PLAN: r0=20(x1), r1=88(y1), r2=6(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 88
LDI r2, 6
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
