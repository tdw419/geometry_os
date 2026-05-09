; DESCRIPTION: Renders a white line between points (19, 195) and (155, 90).
; PLAN: r0=19(x1), r1=195(y1), r2=155(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 195
LDI r2, 155
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
