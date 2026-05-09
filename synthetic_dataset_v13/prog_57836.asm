; DESCRIPTION: Places a black line segment connecting (134, 223) to (383, 237).
; PLAN: r0=134(x1), r1=223(y1), r2=383(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 223
LDI r2, 383
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
