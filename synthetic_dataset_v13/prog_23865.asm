; DESCRIPTION: Draws a blue line from (360, 36) to (448, 77).
; PLAN: r0=360(x1), r1=36(y1), r2=448(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 36
LDI r2, 448
LDI r3, 77
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
