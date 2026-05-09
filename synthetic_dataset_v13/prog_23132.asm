; DESCRIPTION: Places a black line segment connecting (408, 126) to (227, 226).
; PLAN: r0=408(x1), r1=126(y1), r2=227(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 126
LDI r2, 227
LDI r3, 226
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
