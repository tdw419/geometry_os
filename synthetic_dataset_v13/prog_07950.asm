; DESCRIPTION: Places a orange circle of radius 27 at center (39, 80).
; PLAN: r0=39(x), r1=80(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 39
LDI r1, 80
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
