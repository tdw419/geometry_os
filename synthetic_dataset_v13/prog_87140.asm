; DESCRIPTION: Renders a black line between points (390, 194) and (7, 14).
; PLAN: r0=390(x1), r1=194(y1), r2=7(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 194
LDI r2, 7
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
