; DESCRIPTION: Draws a blue line from (443, 21) to (390, 144).
; PLAN: r0=443(x1), r1=21(y1), r2=390(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 21
LDI r2, 390
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
