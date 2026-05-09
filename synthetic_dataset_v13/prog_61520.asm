; DESCRIPTION: Places a orange circle of radius 35 at center (109, 91).
; PLAN: r0=109(x), r1=91(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 91
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
