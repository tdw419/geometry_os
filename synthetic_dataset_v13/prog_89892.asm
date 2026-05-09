; DESCRIPTION: Places a orange circle of radius 70 at center (176, 159).
; PLAN: r0=176(x), r1=159(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 159
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
