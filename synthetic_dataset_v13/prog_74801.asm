; DESCRIPTION: Places a black line segment connecting (440, 34) to (21, 97).
; PLAN: r0=440(x1), r1=34(y1), r2=21(x2), r3=97(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 34
LDI r2, 21
LDI r3, 97
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
