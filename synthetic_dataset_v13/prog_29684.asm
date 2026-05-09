; DESCRIPTION: Places a black line segment connecting (464, 101) to (333, 109).
; PLAN: r0=464(x1), r1=101(y1), r2=333(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 101
LDI r2, 333
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
