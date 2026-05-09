; DESCRIPTION: Places a orange circle of radius 40 at center (332, 159).
; PLAN: r0=332(x), r1=159(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 159
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
