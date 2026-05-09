; DESCRIPTION: Places a orange circle of radius 10 at center (153, 15).
; PLAN: r0=153(x), r1=15(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 15
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
