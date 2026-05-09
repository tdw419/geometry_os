; DESCRIPTION: Draws a purple line from (224, 41) to (302, 158).
; PLAN: r0=224(x1), r1=41(y1), r2=302(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 41
LDI r2, 302
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
