; DESCRIPTION: Renders a black line between points (388, 191) and (309, 23).
; PLAN: r0=388(x1), r1=191(y1), r2=309(x2), r3=23(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 191
LDI r2, 309
LDI r3, 23
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
