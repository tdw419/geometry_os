; DESCRIPTION: Places a black line segment connecting (12, 114) to (223, 118).
; PLAN: r0=12(x1), r1=114(y1), r2=223(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 114
LDI r2, 223
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
