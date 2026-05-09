; DESCRIPTION: Renders a white line between points (452, 243) and (237, 211).
; PLAN: r0=452(x1), r1=243(y1), r2=237(x2), r3=211(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 243
LDI r2, 237
LDI r3, 211
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
