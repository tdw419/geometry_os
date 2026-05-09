; DESCRIPTION: Places a blue line segment connecting (85, 133) to (386, 72).
; PLAN: r0=85(x1), r1=133(y1), r2=386(x2), r3=72(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 133
LDI r2, 386
LDI r3, 72
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
