; DESCRIPTION: Places a orange circle of radius 14 at center (165, 48).
; PLAN: r0=165(x), r1=48(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 48
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
