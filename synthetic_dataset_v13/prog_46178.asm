; DESCRIPTION: Places a orange circle of radius 53 at center (380, 74).
; PLAN: r0=380(x), r1=74(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 74
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
