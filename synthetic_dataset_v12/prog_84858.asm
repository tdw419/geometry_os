; DESCRIPTION: Places a orange circle of radius 48 at center (361, 105).
; PLAN: r0=361(x), r1=105(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 105
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
