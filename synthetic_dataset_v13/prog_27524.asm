; DESCRIPTION: Renders a red line between points (104, 18) and (388, 74).
; PLAN: r0=104(x1), r1=18(y1), r2=388(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 18
LDI r2, 388
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
