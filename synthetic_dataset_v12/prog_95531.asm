; DESCRIPTION: Draws a black line from (185, 35) to (409, 245).
; PLAN: r0=185(x1), r1=35(y1), r2=409(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 35
LDI r2, 409
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
