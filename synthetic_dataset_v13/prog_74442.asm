; DESCRIPTION: Draws a blue line from (364, 224) to (197, 106).
; PLAN: r0=364(x1), r1=224(y1), r2=197(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 224
LDI r2, 197
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
