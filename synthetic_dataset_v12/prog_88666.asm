; DESCRIPTION: Places a orange circle of radius 41 at center (120, 205).
; PLAN: r0=120(x), r1=205(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 205
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
