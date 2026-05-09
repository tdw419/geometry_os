; DESCRIPTION: Places a purple line segment connecting (290, 24) to (305, 102).
; PLAN: r0=290(x1), r1=24(y1), r2=305(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 24
LDI r2, 305
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
