; DESCRIPTION: Places a blue line segment connecting (453, 61) to (217, 62).
; PLAN: r0=453(x1), r1=61(y1), r2=217(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 61
LDI r2, 217
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
