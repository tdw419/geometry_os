; DESCRIPTION: Places a black line segment connecting (417, 134) to (25, 131).
; PLAN: r0=417(x1), r1=134(y1), r2=25(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 134
LDI r2, 25
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
