; DESCRIPTION: Places a black line segment connecting (366, 18) to (146, 53).
; PLAN: r0=366(x1), r1=18(y1), r2=146(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 18
LDI r2, 146
LDI r3, 53
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
