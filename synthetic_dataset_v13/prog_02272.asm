; DESCRIPTION: Places a purple line segment connecting (302, 255) to (5, 239).
; PLAN: r0=302(x1), r1=255(y1), r2=5(x2), r3=239(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 255
LDI r2, 5
LDI r3, 239
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
