; DESCRIPTION: Renders a red line between points (496, 67) and (201, 15).
; PLAN: r0=496(x1), r1=67(y1), r2=201(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 67
LDI r2, 201
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
