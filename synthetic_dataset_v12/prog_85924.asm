; DESCRIPTION: Renders a black line between points (390, 24) and (243, 76).
; PLAN: r0=390(x1), r1=24(y1), r2=243(x2), r3=76(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 24
LDI r2, 243
LDI r3, 76
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
