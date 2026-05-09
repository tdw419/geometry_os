; DESCRIPTION: Renders a red line between points (390, 194) and (381, 69).
; PLAN: r0=390(x1), r1=194(y1), r2=381(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 194
LDI r2, 381
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
