; DESCRIPTION: Places a black circle of radius 76 at center (307, 160).
; PLAN: r0=307(x), r1=160(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 307
LDI r1, 160
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
