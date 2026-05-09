; DESCRIPTION: Renders a red line between points (124, 29) and (366, 130).
; PLAN: r0=124(x1), r1=29(y1), r2=366(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 29
LDI r2, 366
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
