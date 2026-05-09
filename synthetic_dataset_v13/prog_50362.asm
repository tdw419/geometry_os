; DESCRIPTION: Renders a white line between points (100, 136) and (124, 14).
; PLAN: r0=100(x1), r1=136(y1), r2=124(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 136
LDI r2, 124
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
