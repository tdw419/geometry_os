; DESCRIPTION: Places a orange circle of radius 48 at center (193, 191).
; PLAN: r0=193(x), r1=191(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 191
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
