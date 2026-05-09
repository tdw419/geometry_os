; DESCRIPTION: Renders a green line between points (81, 181) and (0, 183).
; PLAN: r0=81(x1), r1=181(y1), r2=0(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 181
LDI r2, 0
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
