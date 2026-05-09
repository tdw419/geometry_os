; DESCRIPTION: Places a purple line segment connecting (130, 38) to (102, 143).
; PLAN: r0=130(x1), r1=38(y1), r2=102(x2), r3=143(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 38
LDI r2, 102
LDI r3, 143
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
