; DESCRIPTION: Renders a black line between points (491, 83) and (278, 230).
; PLAN: r0=491(x1), r1=83(y1), r2=278(x2), r3=230(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 83
LDI r2, 278
LDI r3, 230
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
