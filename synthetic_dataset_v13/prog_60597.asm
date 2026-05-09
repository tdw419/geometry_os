; DESCRIPTION: Places a yellow line segment connecting (134, 78) to (171, 23).
; PLAN: r0=134(x1), r1=78(y1), r2=171(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 78
LDI r2, 171
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
