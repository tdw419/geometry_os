; DESCRIPTION: Places a black line segment connecting (44, 230) to (423, 250).
; PLAN: r0=44(x1), r1=230(y1), r2=423(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 230
LDI r2, 423
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
