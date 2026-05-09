; DESCRIPTION: Renders a yellow line between points (274, 45) and (68, 122).
; PLAN: r0=274(x1), r1=45(y1), r2=68(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 45
LDI r2, 68
LDI r3, 122
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
