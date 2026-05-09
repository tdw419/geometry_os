; DESCRIPTION: Places a black line segment connecting (333, 250) to (475, 6).
; PLAN: r0=333(x1), r1=250(y1), r2=475(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 250
LDI r2, 475
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
