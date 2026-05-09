; DESCRIPTION: Places a orange circle of radius 32 at center (413, 66).
; PLAN: r0=413(x), r1=66(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 66
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
