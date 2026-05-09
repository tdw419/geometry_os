; DESCRIPTION: Places a black circle of radius 40 at center (42, 105).
; PLAN: r0=42(x), r1=105(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 105
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
