; DESCRIPTION: Draws a magenta line from (503, 155) to (244, 1).
; PLAN: r0=503(x1), r1=155(y1), r2=244(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 155
LDI r2, 244
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
