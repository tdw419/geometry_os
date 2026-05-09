; DESCRIPTION: Draws a green line from (478, 251) to (318, 76).
; PLAN: r0=478(x1), r1=251(y1), r2=318(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 251
LDI r2, 318
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
