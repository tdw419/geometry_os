; DESCRIPTION: Renders a red line between points (407, 11) and (45, 62).
; PLAN: r0=407(x1), r1=11(y1), r2=45(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 11
LDI r2, 45
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
