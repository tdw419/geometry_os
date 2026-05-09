; DESCRIPTION: Draws a yellow line from (144, 4) to (462, 25).
; PLAN: r0=144(x1), r1=4(y1), r2=462(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 4
LDI r2, 462
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
