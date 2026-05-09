; DESCRIPTION: Renders a orange line between points (274, 87) and (39, 102).
; PLAN: r0=274(x1), r1=87(y1), r2=39(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 87
LDI r2, 39
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
