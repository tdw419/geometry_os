; DESCRIPTION: Draws a yellow line from (491, 46) to (224, 158).
; PLAN: r0=491(x1), r1=46(y1), r2=224(x2), r3=158(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 46
LDI r2, 224
LDI r3, 158
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
