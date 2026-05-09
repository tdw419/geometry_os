; DESCRIPTION: Renders a green line between points (478, 124) and (355, 219).
; PLAN: r0=478(x1), r1=124(y1), r2=355(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 124
LDI r2, 355
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
