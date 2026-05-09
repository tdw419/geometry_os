; DESCRIPTION: Renders a red line between points (375, 137) and (102, 71).
; PLAN: r0=375(x1), r1=137(y1), r2=102(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 137
LDI r2, 102
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
