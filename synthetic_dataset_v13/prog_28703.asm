; DESCRIPTION: Places a orange circle of radius 46 at center (276, 76).
; PLAN: r0=276(x), r1=76(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 76
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
