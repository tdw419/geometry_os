; DESCRIPTION: Renders a green line between points (491, 94) and (289, 57).
; PLAN: r0=491(x1), r1=94(y1), r2=289(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 94
LDI r2, 289
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
