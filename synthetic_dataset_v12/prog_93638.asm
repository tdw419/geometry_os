; DESCRIPTION: Renders a orange line between points (113, 56) and (105, 122).
; PLAN: r0=113(x1), r1=56(y1), r2=105(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 56
LDI r2, 105
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
