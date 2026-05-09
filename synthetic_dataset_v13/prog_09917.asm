; DESCRIPTION: Places a black line segment connecting (444, 241) to (274, 207).
; PLAN: r0=444(x1), r1=241(y1), r2=274(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 241
LDI r2, 274
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
