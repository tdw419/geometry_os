; DESCRIPTION: Places a white line segment connecting (34, 132) to (222, 40).
; PLAN: r0=34(x1), r1=132(y1), r2=222(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 132
LDI r2, 222
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
