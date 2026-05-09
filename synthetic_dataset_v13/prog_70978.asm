; DESCRIPTION: Renders a black line between points (25, 159) and (44, 183).
; PLAN: r0=25(x1), r1=159(y1), r2=44(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 159
LDI r2, 44
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
