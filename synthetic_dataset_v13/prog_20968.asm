; DESCRIPTION: Renders a orange line between points (473, 84) and (39, 86).
; PLAN: r0=473(x1), r1=84(y1), r2=39(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 84
LDI r2, 39
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
