; DESCRIPTION: Places a orange circle of radius 62 at center (262, 158).
; PLAN: r0=262(x), r1=158(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 158
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
