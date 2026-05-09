; DESCRIPTION: Places a black circle of radius 17 at center (230, 192).
; PLAN: r0=230(x), r1=192(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 192
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
