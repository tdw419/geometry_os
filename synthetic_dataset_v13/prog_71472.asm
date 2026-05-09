; DESCRIPTION: Renders a purple line between points (310, 202) and (26, 12).
; PLAN: r0=310(x1), r1=202(y1), r2=26(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 202
LDI r2, 26
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
