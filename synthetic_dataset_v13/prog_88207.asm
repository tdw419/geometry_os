; DESCRIPTION: Draws a yellow line from (462, 22) to (436, 253).
; PLAN: r0=462(x1), r1=22(y1), r2=436(x2), r3=253(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 22
LDI r2, 436
LDI r3, 253
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
