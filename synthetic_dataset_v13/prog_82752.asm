; DESCRIPTION: Places a blue line segment connecting (80, 30) to (48, 44).
; PLAN: r0=80(x1), r1=30(y1), r2=48(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 30
LDI r2, 48
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
