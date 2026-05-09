; DESCRIPTION: Renders a black line between points (426, 246) and (52, 148).
; PLAN: r0=426(x1), r1=246(y1), r2=52(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 246
LDI r2, 52
LDI r3, 148
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
