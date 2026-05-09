; DESCRIPTION: Places a black line segment connecting (447, 210) to (38, 149).
; PLAN: r0=447(x1), r1=210(y1), r2=38(x2), r3=149(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 210
LDI r2, 38
LDI r3, 149
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
