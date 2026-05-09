; DESCRIPTION: Renders a orange line between points (90, 76) and (473, 39).
; PLAN: r0=90(x1), r1=76(y1), r2=473(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 76
LDI r2, 473
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
