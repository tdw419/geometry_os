; DESCRIPTION: Draws a orange line from (448, 196) to (454, 133).
; PLAN: r0=448(x1), r1=196(y1), r2=454(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 196
LDI r2, 454
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
