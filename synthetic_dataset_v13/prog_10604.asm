; DESCRIPTION: Places a orange circle of radius 73 at center (252, 93).
; PLAN: r0=252(x), r1=93(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 93
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
