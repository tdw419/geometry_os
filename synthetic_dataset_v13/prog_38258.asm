; DESCRIPTION: Places a blue line segment connecting (337, 110) to (461, 190).
; PLAN: r0=337(x1), r1=110(y1), r2=461(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 110
LDI r2, 461
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
