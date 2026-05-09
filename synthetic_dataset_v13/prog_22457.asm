; DESCRIPTION: Places a black line segment connecting (442, 55) to (44, 212).
; PLAN: r0=442(x1), r1=55(y1), r2=44(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 55
LDI r2, 44
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
