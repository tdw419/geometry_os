; DESCRIPTION: Renders a orange line between points (92, 183) and (406, 63).
; PLAN: r0=92(x1), r1=183(y1), r2=406(x2), r3=63(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 183
LDI r2, 406
LDI r3, 63
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
