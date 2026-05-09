; DESCRIPTION: Places a red circle of radius 63 at center (354, 66).
; PLAN: r0=354(x), r1=66(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 66
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
