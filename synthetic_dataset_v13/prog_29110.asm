; DESCRIPTION: Renders a orange line between points (245, 244) and (378, 71).
; PLAN: r0=245(x1), r1=244(y1), r2=378(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 244
LDI r2, 378
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
