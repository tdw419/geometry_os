; DESCRIPTION: Places a black line segment connecting (69, 159) to (105, 102).
; PLAN: r0=69(x1), r1=159(y1), r2=105(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 159
LDI r2, 105
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
