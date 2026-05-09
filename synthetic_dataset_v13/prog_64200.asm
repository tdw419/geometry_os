; DESCRIPTION: Renders a black line between points (258, 183) and (264, 91).
; PLAN: r0=258(x1), r1=183(y1), r2=264(x2), r3=91(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 183
LDI r2, 264
LDI r3, 91
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
