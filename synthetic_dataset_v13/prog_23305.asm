; DESCRIPTION: Renders a white line between points (232, 195) and (136, 96).
; PLAN: r0=232(x1), r1=195(y1), r2=136(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 195
LDI r2, 136
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
