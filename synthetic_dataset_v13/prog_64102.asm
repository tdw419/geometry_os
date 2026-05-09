; DESCRIPTION: Renders a white line between points (124, 14) and (158, 141).
; PLAN: r0=124(x1), r1=14(y1), r2=158(x2), r3=141(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 14
LDI r2, 158
LDI r3, 141
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
