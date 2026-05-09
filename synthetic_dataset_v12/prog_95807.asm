; DESCRIPTION: Places a green line segment connecting (222, 250) to (442, 133).
; PLAN: r0=222(x1), r1=250(y1), r2=442(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 250
LDI r2, 442
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
