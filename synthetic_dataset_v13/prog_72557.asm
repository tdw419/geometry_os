; DESCRIPTION: Renders a yellow line between points (159, 69) and (337, 181).
; PLAN: r0=159(x1), r1=69(y1), r2=337(x2), r3=181(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 69
LDI r2, 337
LDI r3, 181
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
