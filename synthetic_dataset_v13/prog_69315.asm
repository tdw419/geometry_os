; DESCRIPTION: Places a black line segment connecting (93, 60) to (323, 44).
; PLAN: r0=93(x1), r1=60(y1), r2=323(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 60
LDI r2, 323
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
