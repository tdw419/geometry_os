; DESCRIPTION: Places a blue line segment connecting (83, 132) to (5, 40).
; PLAN: r0=83(x1), r1=132(y1), r2=5(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 132
LDI r2, 5
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
