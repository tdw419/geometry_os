; DESCRIPTION: Places a orange circle of radius 38 at center (189, 97).
; PLAN: r0=189(x), r1=97(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 97
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
