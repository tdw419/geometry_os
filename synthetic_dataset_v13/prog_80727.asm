; DESCRIPTION: Places a yellow line segment connecting (38, 251) to (77, 170).
; PLAN: r0=38(x1), r1=251(y1), r2=77(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 251
LDI r2, 77
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
