; DESCRIPTION: Places a blue line segment connecting (387, 11) to (190, 140).
; PLAN: r0=387(x1), r1=11(y1), r2=190(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 11
LDI r2, 190
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
