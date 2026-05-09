; DESCRIPTION: Draws a black line from (478, 248) to (99, 102).
; PLAN: r0=478(x1), r1=248(y1), r2=99(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 248
LDI r2, 99
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
