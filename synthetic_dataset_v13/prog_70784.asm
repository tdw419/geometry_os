; DESCRIPTION: Places a black line segment connecting (333, 121) to (200, 149).
; PLAN: r0=333(x1), r1=121(y1), r2=200(x2), r3=149(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 121
LDI r2, 200
LDI r3, 149
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
