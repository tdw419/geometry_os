; DESCRIPTION: Places a blue line segment connecting (5, 190) to (49, 73).
; PLAN: r0=5(x1), r1=190(y1), r2=49(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 190
LDI r2, 49
LDI r3, 73
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
