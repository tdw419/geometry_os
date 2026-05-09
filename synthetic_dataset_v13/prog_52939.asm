; DESCRIPTION: Places a black line segment connecting (69, 84) to (101, 255).
; PLAN: r0=69(x1), r1=84(y1), r2=101(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 84
LDI r2, 101
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
