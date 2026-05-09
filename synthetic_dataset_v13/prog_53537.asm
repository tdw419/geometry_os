; DESCRIPTION: Renders a blue line between points (363, 193) and (69, 134).
; PLAN: r0=363(x1), r1=193(y1), r2=69(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 193
LDI r2, 69
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
