; DESCRIPTION: Places a green line segment connecting (33, 4) to (388, 17).
; PLAN: r0=33(x1), r1=4(y1), r2=388(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 4
LDI r2, 388
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
