; DESCRIPTION: Places a black line segment connecting (286, 165) to (100, 81).
; PLAN: r0=286(x1), r1=165(y1), r2=100(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 165
LDI r2, 100
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
