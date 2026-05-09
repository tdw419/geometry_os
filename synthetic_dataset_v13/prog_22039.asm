; DESCRIPTION: Draws a black line from (192, 145) to (426, 230).
; PLAN: r0=192(x1), r1=145(y1), r2=426(x2), r3=230(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 145
LDI r2, 426
LDI r3, 230
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
