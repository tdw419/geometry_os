; DESCRIPTION: Renders a black line between points (216, 237) and (494, 47).
; PLAN: r0=216(x1), r1=237(y1), r2=494(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 237
LDI r2, 494
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
