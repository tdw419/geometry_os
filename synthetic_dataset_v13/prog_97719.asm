; DESCRIPTION: Places a blue line segment connecting (442, 83) to (306, 109).
; PLAN: r0=442(x1), r1=83(y1), r2=306(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 83
LDI r2, 306
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
