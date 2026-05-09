; DESCRIPTION: Draws a yellow line from (322, 21) to (318, 46).
; PLAN: r0=322(x1), r1=21(y1), r2=318(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 21
LDI r2, 318
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
