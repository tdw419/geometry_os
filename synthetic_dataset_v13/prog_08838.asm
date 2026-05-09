; DESCRIPTION: Renders a orange line between points (53, 39) and (319, 219).
; PLAN: r0=53(x1), r1=39(y1), r2=319(x2), r3=219(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 39
LDI r2, 319
LDI r3, 219
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
