; DESCRIPTION: Places a black line segment connecting (108, 6) to (179, 11).
; PLAN: r0=108(x1), r1=6(y1), r2=179(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 6
LDI r2, 179
LDI r3, 11
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
