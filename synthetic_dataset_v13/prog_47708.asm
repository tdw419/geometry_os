; DESCRIPTION: Places a purple line segment connecting (503, 78) to (409, 37).
; PLAN: r0=503(x1), r1=78(y1), r2=409(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 78
LDI r2, 409
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
