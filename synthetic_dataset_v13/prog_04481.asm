; DESCRIPTION: Places a blue line segment connecting (386, 89) to (395, 190).
; PLAN: r0=386(x1), r1=89(y1), r2=395(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 89
LDI r2, 395
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
