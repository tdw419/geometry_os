; DESCRIPTION: Places a purple circle of radius 37 at center (460, 164).
; PLAN: r0=460(x), r1=164(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 164
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
