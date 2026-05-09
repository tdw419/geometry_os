; DESCRIPTION: Places a orange circle of radius 26 at center (327, 106).
; PLAN: r0=327(x), r1=106(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 106
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
