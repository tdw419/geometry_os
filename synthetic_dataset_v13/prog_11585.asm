; DESCRIPTION: Places a blue line segment connecting (47, 174) to (331, 255).
; PLAN: r0=47(x1), r1=174(y1), r2=331(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 174
LDI r2, 331
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
