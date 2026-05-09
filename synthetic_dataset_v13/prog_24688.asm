; DESCRIPTION: Renders a yellow line between points (422, 69) and (448, 252).
; PLAN: r0=422(x1), r1=69(y1), r2=448(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 69
LDI r2, 448
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
