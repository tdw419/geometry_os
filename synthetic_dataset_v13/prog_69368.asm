; DESCRIPTION: Places a yellow line segment connecting (353, 77) to (102, 98).
; PLAN: r0=353(x1), r1=77(y1), r2=102(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 77
LDI r2, 102
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
