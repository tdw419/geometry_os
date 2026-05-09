; DESCRIPTION: Places a orange circle of radius 50 at center (170, 193).
; PLAN: r0=170(x), r1=193(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 193
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
