; DESCRIPTION: Draws a yellow line from (321, 164) to (188, 163).
; PLAN: r0=321(x1), r1=164(y1), r2=188(x2), r3=163(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 164
LDI r2, 188
LDI r3, 163
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
