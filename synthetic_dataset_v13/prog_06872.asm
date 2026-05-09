; DESCRIPTION: Draws a blue line from (418, 106) to (403, 203).
; PLAN: r0=418(x1), r1=106(y1), r2=403(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 106
LDI r2, 403
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
