; DESCRIPTION: Renders a red line between points (217, 68) and (462, 0).
; PLAN: r0=217(x1), r1=68(y1), r2=462(x2), r3=0(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 68
LDI r2, 462
LDI r3, 0
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
