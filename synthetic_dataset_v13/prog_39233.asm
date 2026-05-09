; DESCRIPTION: Places a black line segment connecting (81, 217) to (242, 158).
; PLAN: r0=81(x1), r1=217(y1), r2=242(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 217
LDI r2, 242
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
