; DESCRIPTION: Renders a yellow line between points (496, 179) and (157, 7).
; PLAN: r0=496(x1), r1=179(y1), r2=157(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 179
LDI r2, 157
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
