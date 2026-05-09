; DESCRIPTION: Places a black line segment connecting (403, 198) to (132, 92).
; PLAN: r0=403(x1), r1=198(y1), r2=132(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 198
LDI r2, 132
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
