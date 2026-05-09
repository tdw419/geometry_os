; DESCRIPTION: Places a black line segment connecting (40, 170) to (255, 233).
; PLAN: r0=40(x1), r1=170(y1), r2=255(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 170
LDI r2, 255
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
