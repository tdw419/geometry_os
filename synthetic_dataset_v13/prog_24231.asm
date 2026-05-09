; DESCRIPTION: Places a black line segment connecting (20, 65) to (440, 106).
; PLAN: r0=20(x1), r1=65(y1), r2=440(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 65
LDI r2, 440
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
