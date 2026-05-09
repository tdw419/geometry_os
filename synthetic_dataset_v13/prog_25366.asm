; DESCRIPTION: Places a black line segment connecting (364, 233) to (100, 89).
; PLAN: r0=364(x1), r1=233(y1), r2=100(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 233
LDI r2, 100
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
