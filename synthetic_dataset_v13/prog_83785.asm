; DESCRIPTION: Renders a orange line between points (183, 43) and (127, 219).
; PLAN: r0=183(x1), r1=43(y1), r2=127(x2), r3=219(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 43
LDI r2, 127
LDI r3, 219
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
