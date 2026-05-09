; DESCRIPTION: Places a purple line segment connecting (193, 1) to (12, 164).
; PLAN: r0=193(x1), r1=1(y1), r2=12(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 1
LDI r2, 12
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
