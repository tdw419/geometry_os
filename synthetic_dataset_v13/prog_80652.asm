; DESCRIPTION: Places a orange circle of radius 65 at center (118, 159).
; PLAN: r0=118(x), r1=159(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 159
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
