; DESCRIPTION: Places a black line segment connecting (11, 101) to (7, 108).
; PLAN: r0=11(x1), r1=101(y1), r2=7(x2), r3=108(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 101
LDI r2, 7
LDI r3, 108
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
