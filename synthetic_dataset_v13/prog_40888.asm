; DESCRIPTION: Draws a blue line from (503, 109) to (125, 2).
; PLAN: r0=503(x1), r1=109(y1), r2=125(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 109
LDI r2, 125
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
