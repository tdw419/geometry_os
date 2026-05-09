; DESCRIPTION: Renders a orange line between points (192, 151) and (343, 19).
; PLAN: r0=192(x1), r1=151(y1), r2=343(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 151
LDI r2, 343
LDI r3, 19
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
