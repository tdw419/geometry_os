; DESCRIPTION: Places a orange circle of radius 39 at center (298, 199).
; PLAN: r0=298(x), r1=199(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 199
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
