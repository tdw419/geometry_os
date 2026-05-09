; DESCRIPTION: Renders a blue line between points (270, 127) and (266, 164).
; PLAN: r0=270(x1), r1=127(y1), r2=266(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 127
LDI r2, 266
LDI r3, 164
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
