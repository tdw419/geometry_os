; DESCRIPTION: Renders a black line between points (226, 123) and (144, 15).
; PLAN: r0=226(x1), r1=123(y1), r2=144(x2), r3=15(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 123
LDI r2, 144
LDI r3, 15
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
