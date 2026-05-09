; DESCRIPTION: Places a black circle of radius 45 at center (271, 84).
; PLAN: r0=271(x), r1=84(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 84
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
