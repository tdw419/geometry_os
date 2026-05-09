; DESCRIPTION: Draws a black line from (478, 219) to (275, 7).
; PLAN: r0=478(x1), r1=219(y1), r2=275(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 219
LDI r2, 275
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
