; DESCRIPTION: Renders a black line between points (164, 156) and (381, 96).
; PLAN: r0=164(x1), r1=156(y1), r2=381(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 156
LDI r2, 381
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
