; DESCRIPTION: Places a orange circle of radius 17 at center (170, 178).
; PLAN: r0=170(x), r1=178(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 178
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
