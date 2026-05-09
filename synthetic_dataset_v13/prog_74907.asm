; DESCRIPTION: Places a yellow line segment connecting (225, 34) to (276, 40).
; PLAN: r0=225(x1), r1=34(y1), r2=276(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 34
LDI r2, 276
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
