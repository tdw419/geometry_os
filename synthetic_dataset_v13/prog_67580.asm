; DESCRIPTION: Places a orange circle of radius 73 at center (207, 89).
; PLAN: r0=207(x), r1=89(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 89
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
