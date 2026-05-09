; DESCRIPTION: Places a black circle of radius 67 at center (207, 107).
; PLAN: r0=207(x), r1=107(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 107
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
