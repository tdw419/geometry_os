; DESCRIPTION: Renders a black line between points (105, 156) and (141, 67).
; PLAN: r0=105(x1), r1=156(y1), r2=141(x2), r3=67(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 156
LDI r2, 141
LDI r3, 67
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
