; DESCRIPTION: Places a blue line segment connecting (172, 113) to (12, 122).
; PLAN: r0=172(x1), r1=113(y1), r2=12(x2), r3=122(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 113
LDI r2, 12
LDI r3, 122
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
