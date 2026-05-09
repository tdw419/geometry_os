; DESCRIPTION: Places a black line segment connecting (299, 115) to (73, 227).
; PLAN: r0=299(x1), r1=115(y1), r2=73(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 115
LDI r2, 73
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
