; DESCRIPTION: Renders a black line between points (414, 226) and (508, 54).
; PLAN: r0=414(x1), r1=226(y1), r2=508(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 226
LDI r2, 508
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
