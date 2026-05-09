; DESCRIPTION: Renders a orange line between points (383, 107) and (448, 238).
; PLAN: r0=383(x1), r1=107(y1), r2=448(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 107
LDI r2, 448
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
