; DESCRIPTION: Places a green line segment connecting (288, 190) to (351, 2).
; PLAN: r0=288(x1), r1=190(y1), r2=351(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 190
LDI r2, 351
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
