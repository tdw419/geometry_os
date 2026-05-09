; DESCRIPTION: Places a black line segment connecting (112, 57) to (156, 234).
; PLAN: r0=112(x1), r1=57(y1), r2=156(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 57
LDI r2, 156
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
