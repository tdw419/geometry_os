; DESCRIPTION: Renders a blue line between points (188, 111) and (19, 94).
; PLAN: r0=188(x1), r1=111(y1), r2=19(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 111
LDI r2, 19
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
