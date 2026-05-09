; DESCRIPTION: Renders a black line between points (332, 199) and (216, 135).
; PLAN: r0=332(x1), r1=199(y1), r2=216(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 199
LDI r2, 216
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
