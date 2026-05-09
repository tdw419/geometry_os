; DESCRIPTION: Places a blue line segment connecting (233, 70) to (293, 20).
; PLAN: r0=233(x1), r1=70(y1), r2=293(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 70
LDI r2, 293
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
