; DESCRIPTION: Renders a yellow line between points (87, 114) and (274, 122).
; PLAN: r0=87(x1), r1=114(y1), r2=274(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 114
LDI r2, 274
LDI r3, 122
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
