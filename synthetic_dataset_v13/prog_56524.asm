; DESCRIPTION: Places a black line segment connecting (253, 8) to (93, 51).
; PLAN: r0=253(x1), r1=8(y1), r2=93(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 8
LDI r2, 93
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
