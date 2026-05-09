; DESCRIPTION: Places a blue line segment connecting (340, 170) to (248, 98).
; PLAN: r0=340(x1), r1=170(y1), r2=248(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 170
LDI r2, 248
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
