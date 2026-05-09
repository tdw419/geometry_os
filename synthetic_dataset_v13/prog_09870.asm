; DESCRIPTION: Draws a yellow line from (37, 189) to (136, 59).
; PLAN: r0=37(x1), r1=189(y1), r2=136(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 189
LDI r2, 136
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
