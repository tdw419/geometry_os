; DESCRIPTION: Places a orange circle of radius 47 at center (112, 101).
; PLAN: r0=112(x), r1=101(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 101
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
