; DESCRIPTION: Places a black line segment connecting (478, 250) to (236, 172).
; PLAN: r0=478(x1), r1=250(y1), r2=236(x2), r3=172(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 250
LDI r2, 236
LDI r3, 172
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
