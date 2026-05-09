; DESCRIPTION: Places a red circle of radius 49 at center (455, 67).
; PLAN: r0=455(x), r1=67(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 67
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
