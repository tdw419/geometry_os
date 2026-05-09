; DESCRIPTION: Places a orange circle of radius 15 at center (320, 194).
; PLAN: r0=320(x), r1=194(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 194
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
