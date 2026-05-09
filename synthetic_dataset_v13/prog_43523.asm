; DESCRIPTION: Draws a black line from (40, 230) to (478, 21).
; PLAN: r0=40(x1), r1=230(y1), r2=478(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 230
LDI r2, 478
LDI r3, 21
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
