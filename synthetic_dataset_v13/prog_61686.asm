; DESCRIPTION: Renders a red line between points (310, 201) and (26, 108).
; PLAN: r0=310(x1), r1=201(y1), r2=26(x2), r3=108(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 201
LDI r2, 26
LDI r3, 108
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
