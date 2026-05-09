; DESCRIPTION: Places a black line segment connecting (5, 220) to (343, 33).
; PLAN: r0=5(x1), r1=220(y1), r2=343(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 220
LDI r2, 343
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
