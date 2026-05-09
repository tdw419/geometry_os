; DESCRIPTION: Renders a black line between points (361, 23) and (157, 189).
; PLAN: r0=361(x1), r1=23(y1), r2=157(x2), r3=189(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 23
LDI r2, 157
LDI r3, 189
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
