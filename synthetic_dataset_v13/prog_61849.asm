; DESCRIPTION: Renders a orange line between points (248, 225) and (89, 151).
; PLAN: r0=248(x1), r1=225(y1), r2=89(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 225
LDI r2, 89
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
