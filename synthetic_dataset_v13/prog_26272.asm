; DESCRIPTION: Draws a green line from (478, 119) to (28, 106).
; PLAN: r0=478(x1), r1=119(y1), r2=28(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 119
LDI r2, 28
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
