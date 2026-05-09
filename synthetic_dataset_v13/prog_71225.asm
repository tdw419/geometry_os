; DESCRIPTION: Places a black circle of radius 17 at center (268, 152).
; PLAN: r0=268(x), r1=152(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 152
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
