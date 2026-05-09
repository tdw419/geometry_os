; DESCRIPTION: Places a blue line segment connecting (83, 48) to (106, 55).
; PLAN: r0=83(x1), r1=48(y1), r2=106(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 48
LDI r2, 106
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
