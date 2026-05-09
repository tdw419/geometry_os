; DESCRIPTION: Draws a yellow line from (353, 142) to (437, 224).
; PLAN: r0=353(x1), r1=142(y1), r2=437(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 142
LDI r2, 437
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
