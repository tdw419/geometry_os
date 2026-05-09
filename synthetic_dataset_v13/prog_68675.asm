; DESCRIPTION: Places a black line segment connecting (139, 93) to (222, 249).
; PLAN: r0=139(x1), r1=93(y1), r2=222(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 93
LDI r2, 222
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
