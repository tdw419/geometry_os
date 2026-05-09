; DESCRIPTION: Renders a orange line between points (354, 99) and (89, 219).
; PLAN: r0=354(x1), r1=99(y1), r2=89(x2), r3=219(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 99
LDI r2, 89
LDI r3, 219
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
