; DESCRIPTION: Places a purple line segment connecting (377, 78) to (239, 74).
; PLAN: r0=377(x1), r1=78(y1), r2=239(x2), r3=74(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 78
LDI r2, 239
LDI r3, 74
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
