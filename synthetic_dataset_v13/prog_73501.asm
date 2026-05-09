; DESCRIPTION: Places a purple circle of radius 67 at center (286, 177).
; PLAN: r0=286(x), r1=177(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 177
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
