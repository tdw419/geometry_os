; DESCRIPTION: Places a orange circle of radius 60 at center (61, 103).
; PLAN: r0=61(x), r1=103(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 103
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
