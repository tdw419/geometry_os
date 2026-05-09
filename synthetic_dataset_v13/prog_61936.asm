; DESCRIPTION: Renders a blue line between points (188, 98) and (80, 15).
; PLAN: r0=188(x1), r1=98(y1), r2=80(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 98
LDI r2, 80
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
