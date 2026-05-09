; DESCRIPTION: Renders a orange line between points (142, 94) and (32, 197).
; PLAN: r0=142(x1), r1=94(y1), r2=32(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 94
LDI r2, 32
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
