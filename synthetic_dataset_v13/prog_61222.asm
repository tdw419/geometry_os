; DESCRIPTION: Renders a yellow line between points (448, 70) and (329, 77).
; PLAN: r0=448(x1), r1=70(y1), r2=329(x2), r3=77(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 70
LDI r2, 329
LDI r3, 77
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
