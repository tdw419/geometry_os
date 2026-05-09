; DESCRIPTION: Renders a blue line between points (374, 234) and (35, 61).
; PLAN: r0=374(x1), r1=234(y1), r2=35(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 234
LDI r2, 35
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
