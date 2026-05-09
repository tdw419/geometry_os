; DESCRIPTION: Places a blue line segment connecting (289, 200) to (175, 182).
; PLAN: r0=289(x1), r1=200(y1), r2=175(x2), r3=182(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 200
LDI r2, 175
LDI r3, 182
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
