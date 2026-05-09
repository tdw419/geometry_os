; DESCRIPTION: Places a black line segment connecting (134, 15) to (464, 25).
; PLAN: r0=134(x1), r1=15(y1), r2=464(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 15
LDI r2, 464
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
