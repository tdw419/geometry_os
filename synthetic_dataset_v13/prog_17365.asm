; DESCRIPTION: Places a black line segment connecting (75, 135) to (457, 84).
; PLAN: r0=75(x1), r1=135(y1), r2=457(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 135
LDI r2, 457
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
