; DESCRIPTION: Places a black line segment connecting (260, 60) to (33, 251).
; PLAN: r0=260(x1), r1=60(y1), r2=33(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 60
LDI r2, 33
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
