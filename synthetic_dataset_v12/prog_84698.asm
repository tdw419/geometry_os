; DESCRIPTION: Places a orange circle of radius 49 at center (112, 55).
; PLAN: r0=112(x), r1=55(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 55
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
