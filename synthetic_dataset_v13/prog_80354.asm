; DESCRIPTION: Draws a white line from (0, 199) to (448, 85).
; PLAN: r0=0(x1), r1=199(y1), r2=448(x2), r3=85(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 199
LDI r2, 448
LDI r3, 85
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
