; DESCRIPTION: Renders a blue line between points (161, 132) and (80, 19).
; PLAN: r0=161(x1), r1=132(y1), r2=80(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 132
LDI r2, 80
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
