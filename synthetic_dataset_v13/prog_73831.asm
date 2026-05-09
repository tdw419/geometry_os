; DESCRIPTION: Renders a orange line between points (114, 23) and (425, 219).
; PLAN: r0=114(x1), r1=23(y1), r2=425(x2), r3=219(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 23
LDI r2, 425
LDI r3, 219
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
