; DESCRIPTION: Places a black line segment connecting (84, 159) to (20, 188).
; PLAN: r0=84(x1), r1=159(y1), r2=20(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 159
LDI r2, 20
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
