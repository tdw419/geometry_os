; DESCRIPTION: Places a black line segment connecting (504, 254) to (134, 142).
; PLAN: r0=504(x1), r1=254(y1), r2=134(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 254
LDI r2, 134
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
