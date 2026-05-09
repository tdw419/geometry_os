; DESCRIPTION: Renders a red line between points (71, 2) and (290, 184).
; PLAN: r0=71(x1), r1=2(y1), r2=290(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 2
LDI r2, 290
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
