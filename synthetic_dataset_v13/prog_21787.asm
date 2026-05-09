; DESCRIPTION: Renders a red line between points (119, 92) and (330, 62).
; PLAN: r0=119(x1), r1=92(y1), r2=330(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 92
LDI r2, 330
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
