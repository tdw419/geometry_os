; DESCRIPTION: Renders a orange line between points (238, 32) and (110, 105).
; PLAN: r0=238(x1), r1=32(y1), r2=110(x2), r3=105(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 32
LDI r2, 110
LDI r3, 105
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
