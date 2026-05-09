; DESCRIPTION: Places a black line segment connecting (142, 151) to (9, 200).
; PLAN: r0=142(x1), r1=151(y1), r2=9(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 151
LDI r2, 9
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
