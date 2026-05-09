; DESCRIPTION: Places a black line segment connecting (331, 166) to (115, 142).
; PLAN: r0=331(x1), r1=166(y1), r2=115(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 166
LDI r2, 115
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
