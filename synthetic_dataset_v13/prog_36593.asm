; DESCRIPTION: Places a yellow line segment connecting (6, 31) to (303, 84).
; PLAN: r0=6(x1), r1=31(y1), r2=303(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 31
LDI r2, 303
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
