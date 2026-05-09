; DESCRIPTION: Renders a red line between points (314, 220) and (30, 102).
; PLAN: r0=314(x1), r1=220(y1), r2=30(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 220
LDI r2, 30
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
