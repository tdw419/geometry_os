; DESCRIPTION: Places a orange circle of radius 21 at center (245, 230).
; PLAN: r0=245(x), r1=230(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 230
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
