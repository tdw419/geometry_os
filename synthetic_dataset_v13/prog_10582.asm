; DESCRIPTION: Draws a yellow line from (240, 192) to (188, 160).
; PLAN: r0=240(x1), r1=192(y1), r2=188(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 192
LDI r2, 188
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
