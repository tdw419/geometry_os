; DESCRIPTION: Places a blue line segment connecting (444, 6) to (55, 98).
; PLAN: r0=444(x1), r1=6(y1), r2=55(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 6
LDI r2, 55
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
