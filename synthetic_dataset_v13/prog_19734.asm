; DESCRIPTION: Renders a red line between points (312, 165) and (334, 47).
; PLAN: r0=312(x1), r1=165(y1), r2=334(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 165
LDI r2, 334
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
