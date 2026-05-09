; DESCRIPTION: Places a orange circle of radius 49 at center (253, 188).
; PLAN: r0=253(x), r1=188(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 188
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
