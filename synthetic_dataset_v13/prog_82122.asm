; DESCRIPTION: Places a blue line segment connecting (369, 84) to (296, 125).
; PLAN: r0=369(x1), r1=84(y1), r2=296(x2), r3=125(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 84
LDI r2, 296
LDI r3, 125
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
