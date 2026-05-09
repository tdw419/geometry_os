; DESCRIPTION: Places a black line segment connecting (268, 209) to (189, 201).
; PLAN: r0=268(x1), r1=209(y1), r2=189(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 209
LDI r2, 189
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
