; DESCRIPTION: Places a yellow line segment connecting (4, 38) to (190, 137).
; PLAN: r0=4(x1), r1=38(y1), r2=190(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 38
LDI r2, 190
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
