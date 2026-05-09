; DESCRIPTION: Renders a orange line between points (163, 52) and (382, 64).
; PLAN: r0=163(x1), r1=52(y1), r2=382(x2), r3=64(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 52
LDI r2, 382
LDI r3, 64
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
