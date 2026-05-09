; DESCRIPTION: Places a blue line segment connecting (100, 100) to (126, 12).
; PLAN: r0=100(x1), r1=100(y1), r2=126(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 100
LDI r2, 126
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
