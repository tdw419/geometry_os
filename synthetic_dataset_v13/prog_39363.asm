; DESCRIPTION: Renders a black line between points (25, 101) and (160, 17).
; PLAN: r0=25(x1), r1=101(y1), r2=160(x2), r3=17(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 101
LDI r2, 160
LDI r3, 17
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
