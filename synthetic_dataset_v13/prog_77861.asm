; DESCRIPTION: Places a blue line segment connecting (500, 18) to (371, 186).
; PLAN: r0=500(x1), r1=18(y1), r2=371(x2), r3=186(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 18
LDI r2, 371
LDI r3, 186
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
