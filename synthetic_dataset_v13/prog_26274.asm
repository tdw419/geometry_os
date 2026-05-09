; DESCRIPTION: Renders a red line between points (124, 3) and (486, 5).
; PLAN: r0=124(x1), r1=3(y1), r2=486(x2), r3=5(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 3
LDI r2, 486
LDI r3, 5
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
