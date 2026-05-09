; DESCRIPTION: Renders a black line between points (469, 114) and (449, 45).
; PLAN: r0=469(x1), r1=114(y1), r2=449(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 114
LDI r2, 449
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
