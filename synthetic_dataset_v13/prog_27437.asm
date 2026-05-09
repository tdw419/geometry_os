; DESCRIPTION: Draws a yellow line from (76, 2) to (255, 147).
; PLAN: r0=76(x1), r1=2(y1), r2=255(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 2
LDI r2, 255
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
