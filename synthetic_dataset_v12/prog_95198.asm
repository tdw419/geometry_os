; DESCRIPTION: Places a black line segment connecting (70, 199) to (100, 112).
; PLAN: r0=70(x1), r1=199(y1), r2=100(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 199
LDI r2, 100
LDI r3, 112
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
