; DESCRIPTION: Draws a orange line from (294, 230) to (478, 43).
; PLAN: r0=294(x1), r1=230(y1), r2=478(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 230
LDI r2, 478
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
