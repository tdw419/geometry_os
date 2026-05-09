; DESCRIPTION: Draws a purple line from (134, 79) to (403, 84).
; PLAN: r0=134(x1), r1=79(y1), r2=403(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 79
LDI r2, 403
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
