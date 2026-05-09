; DESCRIPTION: Renders a green line between points (266, 94) and (494, 17).
; PLAN: r0=266(x1), r1=94(y1), r2=494(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 94
LDI r2, 494
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
