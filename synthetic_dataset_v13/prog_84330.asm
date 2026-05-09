; DESCRIPTION: Places a orange circle of radius 50 at center (397, 164).
; PLAN: r0=397(x), r1=164(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 164
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
