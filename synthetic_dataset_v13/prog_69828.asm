; DESCRIPTION: Places a blue line segment connecting (409, 54) to (103, 180).
; PLAN: r0=409(x1), r1=54(y1), r2=103(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 54
LDI r2, 103
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
