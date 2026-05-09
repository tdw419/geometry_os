; DESCRIPTION: Places a yellow line segment connecting (412, 113) to (318, 253).
; PLAN: r0=412(x1), r1=113(y1), r2=318(x2), r3=253(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 113
LDI r2, 318
LDI r3, 253
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
