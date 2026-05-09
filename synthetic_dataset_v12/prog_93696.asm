; DESCRIPTION: Renders a orange line between points (176, 37) and (484, 96).
; PLAN: r0=176(x1), r1=37(y1), r2=484(x2), r3=96(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 37
LDI r2, 484
LDI r3, 96
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
