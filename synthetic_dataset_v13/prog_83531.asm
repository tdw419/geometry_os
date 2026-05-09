; DESCRIPTION: Renders a green line between points (105, 183) and (253, 159).
; PLAN: r0=105(x1), r1=183(y1), r2=253(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 183
LDI r2, 253
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
