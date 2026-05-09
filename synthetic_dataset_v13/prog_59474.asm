; DESCRIPTION: Places a red circle of radius 13 at center (373, 103).
; PLAN: r0=373(x), r1=103(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 103
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
