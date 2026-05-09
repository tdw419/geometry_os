; DESCRIPTION: Draws a yellow line from (222, 13) to (456, 137).
; PLAN: r0=222(x1), r1=13(y1), r2=456(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 13
LDI r2, 456
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
