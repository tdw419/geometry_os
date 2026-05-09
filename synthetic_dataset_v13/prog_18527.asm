; DESCRIPTION: Places a black line segment connecting (82, 25) to (454, 110).
; PLAN: r0=82(x1), r1=25(y1), r2=454(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 25
LDI r2, 454
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
