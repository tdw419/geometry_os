; DESCRIPTION: Renders a white line between points (129, 58) and (448, 1).
; PLAN: r0=129(x1), r1=58(y1), r2=448(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 58
LDI r2, 448
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
