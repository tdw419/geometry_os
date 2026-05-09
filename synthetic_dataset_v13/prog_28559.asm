; DESCRIPTION: Places a red circle of radius 63 at center (412, 87).
; PLAN: r0=412(x), r1=87(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 412
LDI r1, 87
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
