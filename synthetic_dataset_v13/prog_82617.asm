; DESCRIPTION: Places a black line segment connecting (70, 75) to (182, 110).
; PLAN: r0=70(x1), r1=75(y1), r2=182(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 75
LDI r2, 182
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
