; DESCRIPTION: Places a blue line segment connecting (106, 111) to (223, 80).
; PLAN: r0=106(x1), r1=111(y1), r2=223(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 111
LDI r2, 223
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
