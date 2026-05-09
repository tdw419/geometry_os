; DESCRIPTION: Places a orange circle of radius 73 at center (125, 91).
; PLAN: r0=125(x), r1=91(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 91
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
