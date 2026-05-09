; DESCRIPTION: Places a orange circle of radius 29 at center (340, 193).
; PLAN: r0=340(x), r1=193(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 193
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
