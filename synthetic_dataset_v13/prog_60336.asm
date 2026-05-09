; DESCRIPTION: Draws a green line from (161, 224) to (318, 232).
; PLAN: r0=161(x1), r1=224(y1), r2=318(x2), r3=232(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 224
LDI r2, 318
LDI r3, 232
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
