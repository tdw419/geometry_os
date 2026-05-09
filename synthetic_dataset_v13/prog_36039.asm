; DESCRIPTION: Places a purple line segment connecting (3, 38) to (108, 253).
; PLAN: r0=3(x1), r1=38(y1), r2=108(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 38
LDI r2, 108
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
