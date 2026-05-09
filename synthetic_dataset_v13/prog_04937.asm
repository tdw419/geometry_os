; DESCRIPTION: Places a orange circle of radius 52 at center (442, 102).
; PLAN: r0=442(x), r1=102(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 102
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
