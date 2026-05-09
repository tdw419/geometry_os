; DESCRIPTION: Places a black circle of radius 29 at center (94, 134).
; PLAN: r0=94(x), r1=134(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 134
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
