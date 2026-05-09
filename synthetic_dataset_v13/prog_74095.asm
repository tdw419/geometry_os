; DESCRIPTION: Draws a black line from (19, 78) to (376, 89).
; PLAN: r0=19(x1), r1=78(y1), r2=376(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 78
LDI r2, 376
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
