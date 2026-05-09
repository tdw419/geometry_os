; DESCRIPTION: Places a orange circle of radius 39 at center (187, 159).
; PLAN: r0=187(x), r1=159(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 159
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
