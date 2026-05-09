; DESCRIPTION: Places a orange circle of radius 58 at center (262, 137).
; PLAN: r0=262(x), r1=137(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 137
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
