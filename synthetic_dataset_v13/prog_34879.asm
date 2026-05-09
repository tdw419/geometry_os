; DESCRIPTION: Places a black line segment connecting (238, 37) to (185, 214).
; PLAN: r0=238(x1), r1=37(y1), r2=185(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 37
LDI r2, 185
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
