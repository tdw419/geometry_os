; DESCRIPTION: Draws a green line from (478, 71) to (17, 158).
; PLAN: r0=478(x1), r1=71(y1), r2=17(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 71
LDI r2, 17
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
