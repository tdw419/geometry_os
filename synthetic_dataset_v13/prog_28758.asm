; DESCRIPTION: Renders a orange line between points (375, 159) and (192, 239).
; PLAN: r0=375(x1), r1=159(y1), r2=192(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 159
LDI r2, 192
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
