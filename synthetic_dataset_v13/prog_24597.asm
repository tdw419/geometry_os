; DESCRIPTION: Places a black line segment connecting (452, 6) to (332, 93).
; PLAN: r0=452(x1), r1=6(y1), r2=332(x2), r3=93(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 6
LDI r2, 332
LDI r3, 93
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
