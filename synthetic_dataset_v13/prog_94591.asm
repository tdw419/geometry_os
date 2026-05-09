; DESCRIPTION: Places a green circle of radius 57 at center (405, 67).
; PLAN: r0=405(x), r1=67(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 67
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
