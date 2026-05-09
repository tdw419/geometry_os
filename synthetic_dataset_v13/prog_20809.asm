; DESCRIPTION: Draws a blue line from (220, 113) to (65, 238).
; PLAN: r0=220(x1), r1=113(y1), r2=65(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 113
LDI r2, 65
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
