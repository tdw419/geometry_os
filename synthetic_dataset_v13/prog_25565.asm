; DESCRIPTION: Places a orange circle of radius 66 at center (149, 149).
; PLAN: r0=149(x), r1=149(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 149
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
