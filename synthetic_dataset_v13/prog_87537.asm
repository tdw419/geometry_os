; DESCRIPTION: Places a orange circle of radius 17 at center (423, 47).
; PLAN: r0=423(x), r1=47(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 47
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
