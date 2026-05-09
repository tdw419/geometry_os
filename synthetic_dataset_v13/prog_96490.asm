; DESCRIPTION: Places a orange circle of radius 60 at center (172, 188).
; PLAN: r0=172(x), r1=188(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 188
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
