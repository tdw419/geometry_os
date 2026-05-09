; DESCRIPTION: Places a blue line segment connecting (3, 74) to (193, 44).
; PLAN: r0=3(x1), r1=74(y1), r2=193(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 74
LDI r2, 193
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
