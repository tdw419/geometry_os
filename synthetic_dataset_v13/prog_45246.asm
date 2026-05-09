; DESCRIPTION: Renders a purple line between points (151, 24) and (310, 75).
; PLAN: r0=151(x1), r1=24(y1), r2=310(x2), r3=75(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 24
LDI r2, 310
LDI r3, 75
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
