; DESCRIPTION: Places a black line segment connecting (475, 181) to (77, 198).
; PLAN: r0=475(x1), r1=181(y1), r2=77(x2), r3=198(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 181
LDI r2, 77
LDI r3, 198
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
