; DESCRIPTION: Places a black line segment connecting (427, 13) to (103, 35).
; PLAN: r0=427(x1), r1=13(y1), r2=103(x2), r3=35(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 13
LDI r2, 103
LDI r3, 35
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
