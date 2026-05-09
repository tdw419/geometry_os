; DESCRIPTION: Places a black line segment connecting (207, 86) to (439, 114).
; PLAN: r0=207(x1), r1=86(y1), r2=439(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 86
LDI r2, 439
LDI r3, 114
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
