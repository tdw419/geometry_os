; DESCRIPTION: Places a blue line segment connecting (110, 4) to (286, 14).
; PLAN: r0=110(x1), r1=4(y1), r2=286(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 4
LDI r2, 286
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
