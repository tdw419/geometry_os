; DESCRIPTION: Draws a blue line from (503, 108) to (265, 144).
; PLAN: r0=503(x1), r1=108(y1), r2=265(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 108
LDI r2, 265
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
