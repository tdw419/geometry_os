; DESCRIPTION: Places a blue line segment connecting (462, 46) to (500, 18).
; PLAN: r0=462(x1), r1=46(y1), r2=500(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 46
LDI r2, 500
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
