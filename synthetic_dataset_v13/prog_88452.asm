; DESCRIPTION: Renders a black line between points (219, 62) and (290, 66).
; PLAN: r0=219(x1), r1=62(y1), r2=290(x2), r3=66(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 62
LDI r2, 290
LDI r3, 66
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
