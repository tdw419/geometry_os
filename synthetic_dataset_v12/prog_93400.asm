; DESCRIPTION: Places a orange circle of radius 11 at center (365, 171).
; PLAN: r0=365(x), r1=171(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 171
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
