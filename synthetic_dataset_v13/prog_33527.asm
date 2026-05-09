; DESCRIPTION: Places a blue line segment connecting (293, 32) to (395, 99).
; PLAN: r0=293(x1), r1=32(y1), r2=395(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 32
LDI r2, 395
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
