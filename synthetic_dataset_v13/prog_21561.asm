; DESCRIPTION: Renders a yellow line between points (342, 67) and (159, 145).
; PLAN: r0=342(x1), r1=67(y1), r2=159(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 67
LDI r2, 159
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
