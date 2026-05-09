; DESCRIPTION: Places a orange circle of radius 38 at center (82, 183).
; PLAN: r0=82(x), r1=183(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 183
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
