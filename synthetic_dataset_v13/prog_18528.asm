; DESCRIPTION: Places a orange circle of radius 35 at center (361, 195).
; PLAN: r0=361(x), r1=195(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 195
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
