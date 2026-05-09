; DESCRIPTION: Renders a yellow line between points (179, 140) and (189, 73).
; PLAN: r0=179(x1), r1=140(y1), r2=189(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 140
LDI r2, 189
LDI r3, 73
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
