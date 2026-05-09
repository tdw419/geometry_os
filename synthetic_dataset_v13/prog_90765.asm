; DESCRIPTION: Places a blue line segment connecting (94, 233) to (435, 232).
; PLAN: r0=94(x1), r1=233(y1), r2=435(x2), r3=232(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 233
LDI r2, 435
LDI r3, 232
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
