; DESCRIPTION: Places a orange circle of radius 11 at center (487, 228).
; PLAN: r0=487(x), r1=228(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 487
LDI r1, 228
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
