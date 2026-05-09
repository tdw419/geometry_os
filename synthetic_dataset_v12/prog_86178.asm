; DESCRIPTION: Places a black circle of radius 55 at center (271, 191).
; PLAN: r0=271(x), r1=191(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 191
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
