; DESCRIPTION: Places a orange circle of radius 56 at center (262, 93).
; PLAN: r0=262(x), r1=93(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 93
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
