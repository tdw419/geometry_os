; DESCRIPTION: Renders a green line between points (114, 179) and (265, 129).
; PLAN: r0=114(x1), r1=179(y1), r2=265(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 179
LDI r2, 265
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
