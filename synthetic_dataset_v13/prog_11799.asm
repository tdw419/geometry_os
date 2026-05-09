; DESCRIPTION: Places a orange circle of radius 18 at center (438, 47).
; PLAN: r0=438(x), r1=47(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 47
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
