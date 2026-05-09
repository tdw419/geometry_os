; DESCRIPTION: Renders a black line between points (56, 199) and (118, 246).
; PLAN: r0=56(x1), r1=199(y1), r2=118(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 199
LDI r2, 118
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
