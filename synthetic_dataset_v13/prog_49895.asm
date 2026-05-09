; DESCRIPTION: Places a black line segment connecting (387, 214) to (366, 65).
; PLAN: r0=387(x1), r1=214(y1), r2=366(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 214
LDI r2, 366
LDI r3, 65
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
