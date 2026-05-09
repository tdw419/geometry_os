; DESCRIPTION: Places a black line segment connecting (139, 59) to (69, 85).
; PLAN: r0=139(x1), r1=59(y1), r2=69(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 59
LDI r2, 69
LDI r3, 85
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
