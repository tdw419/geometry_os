; DESCRIPTION: Renders a black line between points (302, 177) and (31, 49).
; PLAN: r0=302(x1), r1=177(y1), r2=31(x2), r3=49(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 177
LDI r2, 31
LDI r3, 49
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
