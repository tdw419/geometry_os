; DESCRIPTION: Places a blue line segment connecting (487, 83) to (259, 72).
; PLAN: r0=487(x1), r1=83(y1), r2=259(x2), r3=72(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 83
LDI r2, 259
LDI r3, 72
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
