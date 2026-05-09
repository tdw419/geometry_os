; DESCRIPTION: Places a black line segment connecting (58, 171) to (358, 96).
; PLAN: r0=58(x1), r1=171(y1), r2=358(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 171
LDI r2, 358
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
