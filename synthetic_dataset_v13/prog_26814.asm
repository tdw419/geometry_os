; DESCRIPTION: Draws a yellow line from (114, 156) to (436, 104).
; PLAN: r0=114(x1), r1=156(y1), r2=436(x2), r3=104(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 156
LDI r2, 436
LDI r3, 104
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
