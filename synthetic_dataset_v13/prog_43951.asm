; DESCRIPTION: Draws a yellow line from (380, 169) to (37, 84).
; PLAN: r0=380(x1), r1=169(y1), r2=37(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 169
LDI r2, 37
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
