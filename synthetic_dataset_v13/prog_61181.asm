; DESCRIPTION: Places a blue line segment connecting (439, 133) to (100, 247).
; PLAN: r0=439(x1), r1=133(y1), r2=100(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 133
LDI r2, 100
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
