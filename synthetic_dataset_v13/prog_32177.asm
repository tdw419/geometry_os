; DESCRIPTION: Places a blue line segment connecting (367, 154) to (482, 145).
; PLAN: r0=367(x1), r1=154(y1), r2=482(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 154
LDI r2, 482
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
