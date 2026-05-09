; DESCRIPTION: Places a black line segment connecting (326, 34) to (330, 102).
; PLAN: r0=326(x1), r1=34(y1), r2=330(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 34
LDI r2, 330
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
