; DESCRIPTION: Renders a black line between points (436, 65) and (471, 9).
; PLAN: r0=436(x1), r1=65(y1), r2=471(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 65
LDI r2, 471
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
