; DESCRIPTION: Places a orange circle of radius 57 at center (289, 135).
; PLAN: r0=289(x), r1=135(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 135
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
