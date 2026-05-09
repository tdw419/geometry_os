; DESCRIPTION: Renders a green line between points (497, 78) and (471, 56).
; PLAN: r0=497(x1), r1=78(y1), r2=471(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 78
LDI r2, 471
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
