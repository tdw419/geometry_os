; DESCRIPTION: Places a black line segment connecting (183, 66) to (205, 207).
; PLAN: r0=183(x1), r1=66(y1), r2=205(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 66
LDI r2, 205
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
