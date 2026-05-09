; DESCRIPTION: Places a orange circle of radius 19 at center (35, 153).
; PLAN: r0=35(x), r1=153(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 35
LDI r1, 153
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
