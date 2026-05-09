; DESCRIPTION: Places a blue line segment connecting (302, 200) to (239, 64).
; PLAN: r0=302(x1), r1=200(y1), r2=239(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 200
LDI r2, 239
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
