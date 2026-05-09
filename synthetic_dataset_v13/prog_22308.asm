; DESCRIPTION: Places a orange circle of radius 74 at center (238, 128).
; PLAN: r0=238(x), r1=128(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 128
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
