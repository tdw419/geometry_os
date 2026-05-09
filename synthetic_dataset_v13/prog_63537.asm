; DESCRIPTION: Renders a red line between points (486, 33) and (52, 11).
; PLAN: r0=486(x1), r1=33(y1), r2=52(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 33
LDI r2, 52
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
