; DESCRIPTION: Places a yellow line segment connecting (34, 86) to (430, 33).
; PLAN: r0=34(x1), r1=86(y1), r2=430(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 86
LDI r2, 430
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
