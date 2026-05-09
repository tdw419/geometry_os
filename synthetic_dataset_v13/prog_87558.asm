; DESCRIPTION: Places a orange circle of radius 29 at center (449, 184).
; PLAN: r0=449(x), r1=184(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 184
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
