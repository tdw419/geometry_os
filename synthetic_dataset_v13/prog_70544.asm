; DESCRIPTION: Places a orange circle of radius 17 at center (326, 103).
; PLAN: r0=326(x), r1=103(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 103
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
