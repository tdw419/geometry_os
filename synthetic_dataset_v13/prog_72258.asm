; DESCRIPTION: Renders a blue line between points (261, 200) and (84, 19).
; PLAN: r0=261(x1), r1=200(y1), r2=84(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 200
LDI r2, 84
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
