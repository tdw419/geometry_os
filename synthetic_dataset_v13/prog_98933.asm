; DESCRIPTION: Places a black circle of radius 43 at center (234, 192).
; PLAN: r0=234(x), r1=192(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 192
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
