; DESCRIPTION: Places a green line segment connecting (388, 3) to (73, 70).
; PLAN: r0=388(x1), r1=3(y1), r2=73(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 3
LDI r2, 73
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
