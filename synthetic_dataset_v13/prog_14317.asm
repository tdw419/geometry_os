; DESCRIPTION: Renders a black line between points (486, 199) and (40, 156).
; PLAN: r0=486(x1), r1=199(y1), r2=40(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 199
LDI r2, 40
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
