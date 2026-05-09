; DESCRIPTION: Draws a yellow line from (503, 165) to (451, 87).
; PLAN: r0=503(x1), r1=165(y1), r2=451(x2), r3=87(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 165
LDI r2, 451
LDI r3, 87
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
