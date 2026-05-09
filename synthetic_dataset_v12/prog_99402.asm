; DESCRIPTION: Renders a orange line between points (371, 13) and (93, 107).
; PLAN: r0=371(x1), r1=13(y1), r2=93(x2), r3=107(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 13
LDI r2, 93
LDI r3, 107
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
