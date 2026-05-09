; DESCRIPTION: Places a red circle of radius 63 at center (134, 63).
; PLAN: r0=134(x), r1=63(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 63
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
