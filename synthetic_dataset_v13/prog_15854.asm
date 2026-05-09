; DESCRIPTION: Places a red circle of radius 32 at center (261, 44).
; PLAN: r0=261(x), r1=44(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 44
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
