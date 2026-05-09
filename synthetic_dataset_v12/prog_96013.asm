; DESCRIPTION: Places a blue line segment connecting (221, 154) to (442, 185).
; PLAN: r0=221(x1), r1=154(y1), r2=442(x2), r3=185(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 154
LDI r2, 442
LDI r3, 185
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
