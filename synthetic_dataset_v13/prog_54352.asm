; DESCRIPTION: Places a orange circle of radius 54 at center (172, 81).
; PLAN: r0=172(x), r1=81(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 81
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
