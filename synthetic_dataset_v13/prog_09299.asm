; DESCRIPTION: Renders a white line between points (494, 109) and (62, 211).
; PLAN: r0=494(x1), r1=109(y1), r2=62(x2), r3=211(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 109
LDI r2, 62
LDI r3, 211
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
