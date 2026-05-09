; DESCRIPTION: Renders a orange line between points (448, 184) and (327, 188).
; PLAN: r0=448(x1), r1=184(y1), r2=327(x2), r3=188(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 184
LDI r2, 327
LDI r3, 188
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
