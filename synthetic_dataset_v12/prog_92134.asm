; DESCRIPTION: Places a black line segment connecting (17, 75) to (102, 83).
; PLAN: r0=17(x1), r1=75(y1), r2=102(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 75
LDI r2, 102
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
