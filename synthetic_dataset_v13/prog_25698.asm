; DESCRIPTION: Renders a white line between points (89, 7) and (131, 74).
; PLAN: r0=89(x1), r1=7(y1), r2=131(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 7
LDI r2, 131
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
