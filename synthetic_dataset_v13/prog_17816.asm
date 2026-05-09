; DESCRIPTION: Draws a yellow line from (420, 58) to (55, 17).
; PLAN: r0=420(x1), r1=58(y1), r2=55(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 58
LDI r2, 55
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
