; DESCRIPTION: Renders a orange line between points (274, 61) and (306, 71).
; PLAN: r0=274(x1), r1=61(y1), r2=306(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 61
LDI r2, 306
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
