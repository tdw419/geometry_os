; DESCRIPTION: Places a black line segment connecting (310, 230) to (145, 181).
; PLAN: r0=310(x1), r1=230(y1), r2=145(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 230
LDI r2, 145
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
