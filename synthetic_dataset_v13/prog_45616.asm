; DESCRIPTION: Renders a orange line between points (129, 17) and (410, 239).
; PLAN: r0=129(x1), r1=17(y1), r2=410(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 17
LDI r2, 410
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
