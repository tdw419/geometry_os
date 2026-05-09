; DESCRIPTION: Renders a orange line between points (492, 183) and (341, 61).
; PLAN: r0=492(x1), r1=183(y1), r2=341(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 183
LDI r2, 341
LDI r3, 61
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
