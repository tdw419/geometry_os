; DESCRIPTION: Places a black line segment connecting (189, 4) to (490, 125).
; PLAN: r0=189(x1), r1=4(y1), r2=490(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 4
LDI r2, 490
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
