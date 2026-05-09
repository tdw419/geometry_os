; DESCRIPTION: Renders a blue line between points (205, 81) and (80, 121).
; PLAN: r0=205(x1), r1=81(y1), r2=80(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 81
LDI r2, 80
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
