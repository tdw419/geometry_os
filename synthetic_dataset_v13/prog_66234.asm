; DESCRIPTION: Draws a blue line from (489, 225) to (511, 134).
; PLAN: r0=489(x1), r1=225(y1), r2=511(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 225
LDI r2, 511
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
