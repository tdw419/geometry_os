; DESCRIPTION: Places a red line segment connecting (194, 129) to (227, 110).
; PLAN: r0=194(x1), r1=129(y1), r2=227(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 129
LDI r2, 227
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
