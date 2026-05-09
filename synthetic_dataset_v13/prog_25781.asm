; DESCRIPTION: Renders a blue line between points (97, 10) and (377, 134).
; PLAN: r0=97(x1), r1=10(y1), r2=377(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 10
LDI r2, 377
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
