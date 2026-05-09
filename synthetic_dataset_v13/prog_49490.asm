; DESCRIPTION: Places a yellow line segment connecting (418, 90) to (313, 0).
; PLAN: r0=418(x1), r1=90(y1), r2=313(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 90
LDI r2, 313
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
