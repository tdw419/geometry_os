; DESCRIPTION: Places a yellow line segment connecting (56, 39) to (34, 240).
; PLAN: r0=56(x1), r1=39(y1), r2=34(x2), r3=240(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 39
LDI r2, 34
LDI r3, 240
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
