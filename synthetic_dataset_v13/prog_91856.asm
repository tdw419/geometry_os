; DESCRIPTION: Places a black line segment connecting (93, 232) to (393, 209).
; PLAN: r0=93(x1), r1=232(y1), r2=393(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 232
LDI r2, 393
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
