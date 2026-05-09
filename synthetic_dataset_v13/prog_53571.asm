; DESCRIPTION: Places a black circle of radius 10 at center (449, 160).
; PLAN: r0=449(x), r1=160(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 160
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
