; DESCRIPTION: Places a black circle of radius 45 at center (50, 140).
; PLAN: r0=50(x), r1=140(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 140
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
