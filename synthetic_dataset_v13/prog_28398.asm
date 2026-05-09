; DESCRIPTION: Places a blue line segment connecting (85, 178) to (296, 29).
; PLAN: r0=85(x1), r1=178(y1), r2=296(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 178
LDI r2, 296
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
