; DESCRIPTION: Places a black line segment connecting (265, 245) to (437, 156).
; PLAN: r0=265(x1), r1=245(y1), r2=437(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 245
LDI r2, 437
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
