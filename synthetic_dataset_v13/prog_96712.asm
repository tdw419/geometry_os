; DESCRIPTION: Draws a blue line from (299, 145) to (266, 37).
; PLAN: r0=299(x1), r1=145(y1), r2=266(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 145
LDI r2, 266
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
