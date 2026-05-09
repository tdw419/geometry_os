; DESCRIPTION: Places a purple line segment connecting (450, 109) to (99, 164).
; PLAN: r0=450(x1), r1=109(y1), r2=99(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 109
LDI r2, 99
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
