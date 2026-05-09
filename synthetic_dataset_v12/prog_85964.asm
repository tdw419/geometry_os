; DESCRIPTION: Places a purple line segment connecting (61, 87) to (313, 168).
; PLAN: r0=61(x1), r1=87(y1), r2=313(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 87
LDI r2, 313
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
