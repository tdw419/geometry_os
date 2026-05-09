; DESCRIPTION: Places a red circle of radius 64 at center (117, 114).
; PLAN: r0=117(x), r1=114(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 114
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
