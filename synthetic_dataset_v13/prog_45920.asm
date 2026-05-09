; DESCRIPTION: Places a blue line segment connecting (482, 112) to (331, 16).
; PLAN: r0=482(x1), r1=112(y1), r2=331(x2), r3=16(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 112
LDI r2, 331
LDI r3, 16
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
