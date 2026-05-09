; DESCRIPTION: Renders a black line between points (409, 245) and (339, 202).
; PLAN: r0=409(x1), r1=245(y1), r2=339(x2), r3=202(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 245
LDI r2, 339
LDI r3, 202
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
