; DESCRIPTION: Draws a magenta line from (110, 77) to (503, 200).
; PLAN: r0=110(x1), r1=77(y1), r2=503(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 77
LDI r2, 503
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
