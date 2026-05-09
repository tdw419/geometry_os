; DESCRIPTION: Places a black line segment connecting (324, 25) to (376, 187).
; PLAN: r0=324(x1), r1=25(y1), r2=376(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 25
LDI r2, 376
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
