; DESCRIPTION: Renders a white line between points (73, 79) and (448, 51).
; PLAN: r0=73(x1), r1=79(y1), r2=448(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 79
LDI r2, 448
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
