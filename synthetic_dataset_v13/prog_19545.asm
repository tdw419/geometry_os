; DESCRIPTION: Places a white line segment connecting (190, 80) to (13, 84).
; PLAN: r0=190(x1), r1=80(y1), r2=13(x2), r3=84(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 80
LDI r2, 13
LDI r3, 84
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
