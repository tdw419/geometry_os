; DESCRIPTION: Places a purple line segment connecting (398, 85) to (321, 120).
; PLAN: r0=398(x1), r1=85(y1), r2=321(x2), r3=120(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 85
LDI r2, 321
LDI r3, 120
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
