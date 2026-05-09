; DESCRIPTION: Renders a red line between points (2, 5) and (13, 88).
; PLAN: r0=2(x1), r1=5(y1), r2=13(x2), r3=88(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 5
LDI r2, 13
LDI r3, 88
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
