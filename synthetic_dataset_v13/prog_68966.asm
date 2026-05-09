; DESCRIPTION: Places a black line segment connecting (311, 93) to (341, 44).
; PLAN: r0=311(x1), r1=93(y1), r2=341(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 93
LDI r2, 341
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
