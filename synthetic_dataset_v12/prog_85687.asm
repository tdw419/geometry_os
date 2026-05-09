; DESCRIPTION: Draws a black line from (375, 81) to (250, 49).
; PLAN: r0=375(x1), r1=81(y1), r2=250(x2), r3=49(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 81
LDI r2, 250
LDI r3, 49
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
