; DESCRIPTION: Places a orange circle of radius 46 at center (373, 59).
; PLAN: r0=373(x), r1=59(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 59
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
