; DESCRIPTION: Places a black line segment connecting (435, 238) to (432, 164).
; PLAN: r0=435(x1), r1=238(y1), r2=432(x2), r3=164(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 238
LDI r2, 432
LDI r3, 164
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
