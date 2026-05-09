; DESCRIPTION: Places a green line segment connecting (351, 48) to (170, 175).
; PLAN: r0=351(x1), r1=48(y1), r2=170(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 48
LDI r2, 170
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
