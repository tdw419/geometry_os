; DESCRIPTION: Renders a orange line between points (134, 66) and (333, 105).
; PLAN: r0=134(x1), r1=66(y1), r2=333(x2), r3=105(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 66
LDI r2, 333
LDI r3, 105
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
