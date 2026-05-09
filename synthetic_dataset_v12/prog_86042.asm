; DESCRIPTION: Renders a green line between points (105, 25) and (227, 183).
; PLAN: r0=105(x1), r1=25(y1), r2=227(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 25
LDI r2, 227
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
