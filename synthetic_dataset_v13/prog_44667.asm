; DESCRIPTION: Renders a white line between points (25, 131) and (328, 124).
; PLAN: r0=25(x1), r1=131(y1), r2=328(x2), r3=124(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 131
LDI r2, 328
LDI r3, 124
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
