; DESCRIPTION: Renders a black line between points (59, 13) and (478, 26).
; PLAN: r0=59(x1), r1=13(y1), r2=478(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 13
LDI r2, 478
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
