; DESCRIPTION: Places a black line segment connecting (361, 99) to (71, 118).
; PLAN: r0=361(x1), r1=99(y1), r2=71(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 99
LDI r2, 71
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
