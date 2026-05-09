; DESCRIPTION: Places a black line segment connecting (103, 2) to (160, 66).
; PLAN: r0=103(x1), r1=2(y1), r2=160(x2), r3=66(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 2
LDI r2, 160
LDI r3, 66
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
