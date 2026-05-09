; DESCRIPTION: Draws a black line from (24, 78) to (232, 30).
; PLAN: r0=24(x1), r1=78(y1), r2=232(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 78
LDI r2, 232
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
