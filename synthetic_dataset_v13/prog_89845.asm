; DESCRIPTION: Places a orange circle of radius 36 at center (375, 128).
; PLAN: r0=375(x), r1=128(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 128
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
