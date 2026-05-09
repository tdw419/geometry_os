; DESCRIPTION: Renders a red line between points (12, 176) and (334, 89).
; PLAN: r0=12(x1), r1=176(y1), r2=334(x2), r3=89(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 176
LDI r2, 334
LDI r3, 89
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
