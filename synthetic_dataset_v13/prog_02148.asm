; DESCRIPTION: Places a black line segment connecting (424, 221) to (40, 219).
; PLAN: r0=424(x1), r1=221(y1), r2=40(x2), r3=219(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 221
LDI r2, 40
LDI r3, 219
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
