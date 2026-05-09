; DESCRIPTION: Places a orange circle of radius 21 at center (365, 96).
; PLAN: r0=365(x), r1=96(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 96
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
