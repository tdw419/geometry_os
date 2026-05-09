; DESCRIPTION: Draws a yellow line from (161, 224) to (309, 18).
; PLAN: r0=161(x1), r1=224(y1), r2=309(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 224
LDI r2, 309
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
