; DESCRIPTION: Places a orange circle of radius 13 at center (443, 124).
; PLAN: r0=443(x), r1=124(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 124
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
