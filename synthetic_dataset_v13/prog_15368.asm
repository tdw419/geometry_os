; DESCRIPTION: Renders a orange line between points (94, 226) and (382, 99).
; PLAN: r0=94(x1), r1=226(y1), r2=382(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 226
LDI r2, 382
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
