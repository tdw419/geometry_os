; DESCRIPTION: Renders a orange line between points (163, 107) and (409, 83).
; PLAN: r0=163(x1), r1=107(y1), r2=409(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 107
LDI r2, 409
LDI r3, 83
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
